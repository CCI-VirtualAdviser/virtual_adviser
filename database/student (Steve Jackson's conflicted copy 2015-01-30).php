<!DOCTYPE html>   
<!-- This is a html file for the student's page within the virtual adviser -->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"> 
	<head>
		<meta charset="UTF-8">
		<title> Virtual Adviser</title>		
        <script src="./jqplot/src/jquery.js"></script>
        <script src="./jqplot/src/jquery.jqplot.js"></script>
        <script src="./jqplot/src/plugins/jqplot.barRenderer.js"></script>
        <script src="./jqplot/src/plugins/jqplot.categoryAxisRenderer.js"></script>
        <script src="./jqplot/src/plugins/jqplot.pointLabels.js"></script>
        <script src="./testBars.js"></script>
        <link rel="stylesheet" type="text/css" media='screen' href="css/student.screen.css">
        <link rel="stylesheet" type="text/css" media='screen' href="./jqplot/src/jquery.jqplot.css"/>
		
		<link rel="stylesheet" type="text/css" media='screen' href="css/style.css"/>
            
            <!-- JQuery function using jplot to draw "progress" bars -->
            <script>
            $( document ).ready(function() {
                var data = [[12, 1], [8, 2], [6, 3], [10, 4], [7, 5]];
                var data2 = [[14, 1], [12, 2], [4, 3], [14, 4], [11, 5]];
                var data3 = [[18, 1], [10, 2], [5, 3], [9, 4], [9, 5]];
                var ticks = ['Germany', 'Italy', 'Spain', 'France', 'UK'];
                var options = {
                    animate: true,
                    animateReplot: true,
                    stackSeries: true,
                    seriesDefaults: {
                        renderer: $.jqplot.BarRenderer,
                        pointLabels: {show: true,location: 'w'},
                        rendererOptions: { 
                            barMargin: 10,
                            barDirection: 'horizontal'},
                    },
                    axesDefaults:{
                        tickOptions: {textColor: '#ffffff'}
                    },
                    axes:{
                        yaxis:{renderer: $.jqplot.CategoryAxisRenderer,
                            ticks: ticks,
                            tickOptions: {showGridline:false, showMark:false}
                        },
                        xaxis:{showTicks:false,
                               show: false,
                               tickOptions:{showGridline: false},
                               rendererOptions:{drawBaseline:false}
                        }
                    },
                    grid:{
                        background:'transparent',
                        drawBorder: false,
                        shadow: false}
                };
                 $.jqplot('myChart', [data,data2,data3],options);
            });
            </script>
 </head>
    <body>
		<div id="topNav">
			<img src="images/CrownLogo_White.PNG">
		<div>
	
		<!-- The div that displays the welcome message-->
		<div class="welcome">
			<h1><strong>Welcome, David, I'm Professor Bruce, your Virtual Adviser</strong></h1>
            <p>Your degree program is SIS</p> 
			<p>Your concentration is Web Dev</p>
            <hr/>
            <!-- draw "progress" bars -->
            <div id="myChart" style="height:400px;width:500px; "></div>
			
            
			
            <img src="images/CrownLogo_White.png" alt="UNCC Logo" style="width:194px;height:97px" class = "center">

        </div> <!-- end welcome class div -->
        
	</body>
</html>
