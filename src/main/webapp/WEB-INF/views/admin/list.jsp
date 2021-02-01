<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>    
<%@ page trimDirectiveWhitespaces="true" %>
	<div class="container-fluid">
		<div class="row align-items-center">
			<div class="col-sm-12">
				<h1>사용량</h1>
			</div>
		</div>
		<div class="row align-items-center">
			<div class="col-sm-4">
				<div id="cpu"></div>
			</div>
			<div class="col-sm-4">
				<h4>ram</h4>
				<div id="ram"></div>
			</div>
			<div class="col-sm-4">
				<h4>hdd</h4>
				<div id="hdd"></div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row align-items-center">
			<div class="col-sm-12">
				<h1>시스템 로그</h1>
				<textarea rows="20" cols="" class="form-control"></textarea>
			</div>
		</div>
	</div>
	
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	
	<script>
	window.Apex = {
			  chart: {
			    foreColor: "#000",
			    toolbar: {
			      show: false
			    }
			  },
			  colors: ["#FCCF31", "#17ead9", "#f02fc2"],
			  stroke: {
			    width: 3
			  },
			  dataLabels: {
			    enabled: false
			  },
			  grid: {
			    borderColor: "#40475D"
			  },
			  xaxis: {
			    axisTicks: {
			      color: "#333"
			    },
			    axisBorder: {
			      color: "#333"
			    }
			  },
			  fill: {
			    type: "gradient",
			    gradient: {
			      gradientToColors: ["#F55555", "#6078ea", "#6094ea"]
			    }
			  },
			  tooltip: {
			    theme: "dark",
			    x: {
			      formatter: function (val) {
			        return moment(new Date(val)).format("HH:mm:ss");
			      }
			    }
			  },
			  yaxis: {
			    decimalsInFloat: 2,
			    opposite: true,
			    labels: {
			      offsetX: -10
			    }
			  }
			};
	
	
	var trigoStrength = 3;
	var iteration = 11;

	function getRandom() {
	  var i = iteration;
	  return (
	    (Math.sin(i / trigoStrength) * (i / trigoStrength) +
	      i / trigoStrength +
	      1) *
	    (trigoStrength * 2)
	  );
	}
	
	
	function getRangeRandom(yrange) {
		  return Math.floor(Math.random() * (yrange.max - yrange.min + 1)) + yrange.min;
		}

	function generateMinuteWiseTimeSeries(baseval, count, yrange) {
		  var i = 0;
		  var series = [];
		  while (i < count) {
		    var x = baseval;
		    var y =
		      (Math.sin(i / trigoStrength) * (i / trigoStrength) +
		        i / trigoStrength +
		        1) *
		      (trigoStrength * 2);

		    series.push([x, y]);
		    baseval += 300000;
		    i++;
		  }
		  return series;
		}

		function getNewData(baseval, yrange) {
		  var newTime = baseval + 300000;
		  return {
		    x: newTime,
		    y: Math.floor(Math.random() * (yrange.max - yrange.min + 1)) + yrange.min
		  };
		}
		
		var optionsLine = {
				  chart: {
				    height: 350,
				    type: "line",
				    stacked: true,
				    animations: {
				      enabled: true,
				      easing: "linear",
				      dynamicAnimation: {
				        speed: 1000
				      }
				    },
				    dropShadow: {
				      enabled: true,
				      opacity: 0.3,
				      blur: 5,
				      left: -7,
				      top: 22
				    },
				    events: {
				      animationEnd: function (chartCtx) {
				        const newData1 = chartCtx.w.config.series[0].data.slice();
				        newData1.shift();
				        
				        window.setTimeout(function () {
				          chartCtx.updateOptions(
				            {
				              series: [
				                {
				                  data: newData1
				                }
				              ],
				              subtitle: {  //상태 숫자
				                text: parseInt(getRandom() * Math.random()).toString()
				              }
				            },
				            false,
				            false
				          );
				        }, 300);
				      }
				    },
				    toolbar: {
				      show: false
				    },
				    zoom: {
				      enabled: false
				    }
				  },
				  dataLabels: {
				    enabled: false
				  },
				  stroke: {
				    curve: "straight",
				    width: 5
				  },
				  grid: {
				    padding: {
				      left: 0,
				      right: 0
				    }
				  },
				  markers: {
				    size: 0,
				    hover: {
				      size: 0
				    }
				  },
				  series: [
				    {
				      name: "Running",
				      data: generateMinuteWiseTimeSeries(
				        new Date().getTime(),
				        12,
				        {
				          min: 0,
				          max: 100
				        }
				      )
				    }
				  ],
				  xaxis: {
				    type: "datetime",
				    range: 5000000
				  },
				  title: {
				    text: "Processes",
				    align: "left",
				    style: {
				      fontSize: "12px"
				    }
				  },
				  subtitle: {
				    text: "20",
				    floating: true,
				    align: "right",
				    offsetY: 0,
				    style: {
				      fontSize: "22px"
				    }
				  },
				  legend: {
				    show: true,
				    floating: true,
				    horizontalAlign: "left",
				    onItemClick: {
				      toggleDataSeries: false
				    },
				    position: "top",
				    offsetY: -33,
				    offsetX: 60
				  }
				};

				var chartLine = new ApexCharts(
				  document.querySelector("#cpu"),
				  optionsLine
				);
				chartLine.render();
		
window.setInterval(function () {
	  iteration++;
	  chartLine.updateSeries([
    {
      data: [
        ...chartLine.w.config.series[0].data,
        [chartLine.w.globals.maxX + 300000, getRandom()]
      ]
    }
  ]);
	  
}, 1000);
	</script>
