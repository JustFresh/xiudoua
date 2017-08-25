/**
 *
 */
$(function(){
	var lineChart = echarts.init(document.getElementById('trendChart'));
	lineChart.setOption(trendChart);
});


trendChart = {
    title: {
        text: '2017年7月销售趋势图'
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
    	data:['昨天','今天']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: ['0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23']
    },
    yAxis: {
        type: 'value'
    },
    series: [
        {
            name:'昨天',
            type:'line',
            stack: '总量',
            data:[0,0,0,0,0,0,6,120, 132, 101, 134, 90, 230, 210,156,162,99,76,23,0,0,0,0]
        },
        {
            name:'今天',
            type:'line',
            stack: '总量',
            data:[0,0,0,0,0,0,8,220, 182, 191, 234, 290, 330, 310,299,258,210,150,35,0,0,0,0,0]
        }
    ]
};