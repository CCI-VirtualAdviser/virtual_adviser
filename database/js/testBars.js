$( document ).ready(function() {
    var data = [[12, 1], [8, 2], [6, 3], [10, 4], [7, 5]];
    var data2 = [[14, 1], [12, 2], [4, 3], [14, 4], [11, 5]];
    var data3 = [[18, 1], [10, 2], [5, 3], [9, 4], [9, 5]];
    var ticks = ['Germany', 'Italy', 'Spain', 'France', 'UK'];
    var options = {
        animate: true,
        animateReplot: true,
        title: 'Foreign Customers',
        stackSeries: true,
        seriesDefaults: {
            renderer: $.jqplot.BarRenderer,
            pointLabels: {show: true,location: 'w'},
            rendererOptions: { 
                barMargin: 10,
                barDirection: 'horizontal'},
        },
        /*axesDefaults:{
            tickOptions: {showTickMarks:false}
        },*/
        axes:{
            yaxis:{renderer: $.jqplot.CategoryAxisRenderer,
                ticks: ticks,
                tickOptions: {showGridline:false}
            },
            xaxis:{showTicks:false,
                   tickOptions:{showGridline: false}
            }
        },
        grid:{
            background:'transparent',
            borderColor: '#ffffff',
            shadow: false}
    };
     $.jqplot('myChart', [data,data2,data3],options);
});