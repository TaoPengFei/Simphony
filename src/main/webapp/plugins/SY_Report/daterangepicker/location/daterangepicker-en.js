$(document).ready(function (){
	//时间插件
	//$('#reportrange span').html(moment().subtract('hours', 1).format('YYYY-MM-DD') + '~' + moment().format('YYYY-MM-DD'));
	$('#reportrange span').html(moment().subtract('days', 1).startOf('day').format('YYYY-MM-DD') + '~' + moment().subtract('days', 1).endOf('day').format('YYYY-MM-DD'));
	$('#reportrange').daterangepicker({
		// startDate: moment().startOf('day'),
		//endDate: moment(),
		//minDate: '01/01/2012',	//最小时间
		maxDate : moment(), //最大时间 
		dateLimit : {
			days : 365
		}, //起止时间的最大间隔
		showDropdowns : true,
		showWeekNumbers : false, //是否显示第几周
		//timePicker : true, //是否显示小时和分钟
		timePicker : false,
		timePickerIncrement : 60, //时间的增量，单位为分钟
		timePicker12Hour : false, //是否使用12小时制来显示时间
		ranges : {
			//'最近1小时': [moment().subtract('hours',1), moment()],
			'Today': [moment().startOf('day'), moment()],
			'Yesterday': [moment().subtract('days', 1).startOf('day'), moment().subtract('days', 1).endOf('day')],
			//'This Week': [moment().startOf('day'), moment()],
			//'This Month': [moment().startOf('day'), moment()],
			'Last Week': [moment().subtract('days', 6), moment()],
			'Last half month': [moment().subtract('days', 14), moment()],
			'Last Month': [moment().subtract('days', 29), moment()]
		},
		opens : 'right', //日期选择框的弹出位置
		buttonClasses : [ 'btn btn-default' ],
		applyClass : 'btn-small btn-primary blue',
		cancelClass : 'btn-small',
		format : 'YYYY-MM-DD HH:mm:ss', //控件中from和to 显示的日期格式
		separator : ' to ',
		locale : {
			applyLabel : 'OK',
			cancelLabel : 'Cancel',
			fromLabel : 'Beginning Date',
			toLabel : 'Closing Date',
			customRangeLabel : 'Custom',
			daysOfWeek : [ 'S', 'M', 'T', 'W', 'T', 'F', 'S' ],
			monthNames : [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12' ],
			firstDay : 1
		}
	}, function(start, end, label) {//格式化日期显示框				  
		$('#reportrange span').html(start.format('YYYY-MM-DD') + '~' + end.format('YYYY-MM-DD'));
	});

	//设置日期菜单被选项  --开始--
	var dateOption ;
	if("${riqi}"=='day') {
		dateOption = "Today";
	}else if("${riqi}"=='yday') {
		dateOption = "Yesterday";
	}else if("${riqi}"=='week'){
		dateOption ="This Week";
	}else if("${riqi}"=='month'){
		dateOption ="Last Month";
	}else if("${riqi}"=='year'){
		dateOption ="Last Year";
	}else{
		dateOption = "Custom";
	}
	$(".daterangepicker").find("li").each(function (){
		if($(this).hasClass("active")){
			$(this).removeClass("active");
		}
		if(dateOption==$(this).html()){
			$(this).addClass("active");
		}
	});
	//设置日期菜单被选项  --结束--
})