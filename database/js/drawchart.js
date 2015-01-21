function drawChart() {
    "use strict";
    var s1 = [2, 6, 7],
        s2 = [7, 5, 3],
        s3 = [2, 3, 5],
        s4 = [1, 7, 2],
        dataArray = [s1, s2, s3, 24],
        ticks = ['Jan', 'Feb', 'Mar'];
   
  // chart rendering options
    var $;
    var options = {
            seriesDefaults: {
                renderer: $.jqplot.BarRenderer
            },
            axes: {
                xaxis: {
                    renderer: $.jqplot.CategoryAxisRenderer,
                    ticks: ticks
                }
            }
        };
 
  // draw the chart
    $.jqplot('chartDivId', dataArray, options);
}