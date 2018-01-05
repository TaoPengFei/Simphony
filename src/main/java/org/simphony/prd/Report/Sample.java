package org.simphony.prd.Report;

import org.eclipse.jetty.util.ajax.JSON.Output;
import org.pentaho.reporting.engine.classic.core.ClassicEngineBoot;
import org.pentaho.reporting.engine.classic.core.MasterReport;
import org.pentaho.reporting.engine.classic.core.ReportProcessingException;
import org.pentaho.reporting.engine.classic.core.TableDataFactory;
import org.pentaho.reporting.engine.classic.core.modules.output.pageable.pdf.PdfReportUtil;
import org.pentaho.reporting.engine.classic.core.modules.output.table.html.HtmlReportUtil;
import org.pentaho.reporting.engine.classic.core.modules.output.table.xls.ExcelReportUtil;
import org.pentaho.reporting.engine.classic.core.wizard.RelationalAutoGeneratorPreProcessor;
import org.pentaho.reporting.libraries.resourceloader.Resource;
import org.pentaho.reporting.libraries.resourceloader.ResourceException;
import org.pentaho.reporting.libraries.resourceloader.ResourceManager;
//import org.simphony.prd.sample.Sample4;

import akka.Main;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Sample extends HttpServlet {
    public Sample() {
    }

    /**
     *
     */
    public void init() {
        // Initialize the reporting engine
        ClassicEngineBoot.getInstance().start();
    }

    protected void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        try {
            generateReport(req, resp);
        } catch (ResourceException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        try {
            generateReport(req, resp);
        } catch (ResourceException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    /**
     *
     */
    private static final Map<String, String> contentTypeMap = new HashMap<String, String>();
    static {
        contentTypeMap.put("pdf", "application/pdf");
        contentTypeMap.put("excel2003", "application/vnd.ms-excel");
        contentTypeMap.put("excel", "application/vnd.ms-excel");
        contentTypeMap.put("html", "text/html");
    }

    /**
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     * @throws ResourceException
     * @throws ParseException
     */
    private void generateReport(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException, ResourceException, ParseException {
        // Generate the report definition
    	req.setCharacterEncoding("utf-8");
        final MasterReport report = createReportDefinition();

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date StartDay = dateFormat.parse(req.getParameter("StartDay"));
        Date EndDay = dateFormat.parse(req.getParameter("EndDay"));
        String revenuecenterid = req.getParameter("revenuecenterid");
        String ordertypeid = req.getParameter("ordertypeid");
        String majorgroupreportid = req.getParameter("majorgroupreportid");
        String familygroupreportid = req.getParameter("familygroupreportid");
        String tendermediareportid = req.getParameter("tendermediareportid");
        
 
        report.getParameterValues().put("StartDay", StartDay);
		report.getParameterValues().put("EndDay", EndDay);
        report.getParameterValues().put("revenuecenterid", revenuecenterid);
        report.getParameterValues().put("ordertypeid", ordertypeid);
        report.getParameterValues().put("majorgroupreportid", majorgroupreportid);
        report.getParameterValues().put("familygroupreportid", familygroupreportid);
        report.getParameterValues().put("tendermediareportid", tendermediareportid);

		String outputType = req.getParameter("outputType");
        String fileNameTemp = "SalesOverViewReport";

        if (outputType.equalsIgnoreCase("pdf")) {
            resp.setContentType("application/pdf");
            OutputStream out = resp.getOutputStream();
            try {
                PdfReportUtil.createPDF(report, out);
            } catch (ReportProcessingException e) {
                e.printStackTrace();
            } finally {
                out.close();
            }
        }
        if (outputType.equalsIgnoreCase("html")){
            resp.setContentType("text/html");
            OutputStream out = resp.getOutputStream();
            try {
                HtmlReportUtil.createStreamHTML(report, out);
            } catch (ReportProcessingException e) {
                e.printStackTrace();
            } finally {
                out.close();
            }
        }
        if(outputType.equalsIgnoreCase("excel2003") || outputType.equalsIgnoreCase("excel2007")){
            if(outputType.equalsIgnoreCase("excel2003")) {
                resp.setHeader("Content-disposition", "attachment;filename="+fileNameTemp+".xls");
                OutputStream out = resp.getOutputStream();
                try {
                    ExcelReportUtil.createXLS(report, out);
                } catch (ReportProcessingException e) {
                    e.printStackTrace();
                } finally {
                    out.close();
                }
            } else if(outputType.equalsIgnoreCase("excel2007")){
                resp.setHeader("Content-disposition", "attachment;filename="+fileNameTemp+".xlsx");
                OutputStream out = resp.getOutputStream();
                try {
                    ExcelReportUtil.createXLSX(report, out);
                } catch (ReportProcessingException e) {
                    e.printStackTrace();
                }  finally {
                    out.close();
                }
            }
        }

        // Run the report and save the HTML output to a byte stream
        //resp.setContentType("text/html"); // Change to "application/pdf" for PDF output
        //resp.setContentType("application/pdf");
        //OutputStream out = resp.getOutputStream();
        //try {
            // Use the HtmlReportUtil to generate the report to a Stream HTML
            //HtmlReportUtil.createStreamHTML(report, out);

            //NOTE: Changing this to use PDF is simple:
            // 1. Change the above setContent call to use "application/pdf"
            // 2. Instead of HtmlReportUtil, use the following line:
            //PdfReportUtil.createPDF(report, out);
        /*} catch (ReportProcessingException rpe) {
            rpe.printStackTrace();
        } finally {
            out.close();
        }*/
    }

    /**
     *
     * @return
     * @throws ResourceException
     */
    private MasterReport createReportDefinition() throws ResourceException {
        Resource directly = null;
        try {
            final ClassLoader classloader = this.getClass().getClassLoader();
            final URL reportDefinitionURL = classloader.getResource("reports/SalesOverViewReport.prpt");

            // Parse the report file
            final ResourceManager resourceManager = new ResourceManager();
            directly = resourceManager.createDirectly(reportDefinitionURL, MasterReport.class);
        } catch (ResourceException e) {
            e.printStackTrace();
        }
        return (MasterReport) directly.getResource();
    }

}
