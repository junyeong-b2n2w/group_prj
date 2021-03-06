<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    @import url(https://fonts.googleapis.com/css?family=Lato:300,400,700);

* {
  box-sizing: border-box;
}

.containers {
  max-width: 620px;
  position: relative;
  margin: 0 auto;
  padding: 0 0;
}
.containers:before, .container:after {
  content: "";
  display: table;
}
.containers:after {
  clear: both;
}

.row:before, .row:after {
  content: "";
  display: table;
}
.row:after {
  clear: both;
}

.columns {
  float: left;
  display: block;
  margin-bottom: 0px;
  vertical-align: top;
  padding: 0;
}

.columns.sm-four {
  width: 33.33%;
}
.columns.sm-days {
  width: 14.28%;
  opacity: 0;
}



body {
/*   color: #fff; */
  font-family: "Lato", "Arial", sans-serif;
  line-height: 1.6;
  transition: all 0.5s;
}

.containers {
  background: rgba(64, 165, 188, 0.8);
  border-radius: 0.5rem;
  box-shadow: inset 0 1.5px 4px rgba(255, 255, 255, 0.25), inset 0 1.5px 6px rgba(255, 255, 255, 0.25);
  margin: 5rem auto;
  min-height: 200px;
  overflow: hidden;
}

/* Header Section */
header {
  font-size: 3rem;
  font-weight: 300;
  padding: 1rem;
  text-align: center;
  overflow: hidden;
}
header h2 {
  width: 100%;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.current-city-day {
  font-size: 1rem;
  display: block;
}

sup {
  position: relative;
  top: -1em;
  font-size: 50%;
}

.current-city-weather {
  font-size: 4rem;
}

/* Week Days Section */
.week-days {
  font-weight: 700;
  text-align: center;
}

.day {
  background: #55a0b3;
  border: 1px solid #86bdc9;
}

.sm-days {
  border-right: 1px solid #86bdc9;
  cursor: pointer;
}
.sm-days:last-child {
  border: none;
}

.day-weather-icon,
.day-weather-info {
  margin: 1rem 0;
}

.day-weather-icon {
  font-size: 2.5rem;
}

/* Media Queries */
@media (max-width: 720px) {
  html {
    font-size: 12px;
  }
}
@media (max-width: 520px) {
  body {
    padding: 1rem;
  }

  .columns {
    float: left;
    margin-left: 0;
    margin-top: 1rem;
  }
  .columns:nth-child(odd) {
    margin-left: 0;
  }
  .columns.sm-four, .columns.sm-days {
    width: 100%;
  }

  .day {
    padding: 1rem;
  }

  .current-city-day {
    font-size: 2rem;
  }
}
/* Keyframes */
@keyframes fadeInUp {
  0% {
    opacity: 0;
    transform: translate3d(0, 100%, 0);
  }
  100% {
    opacity: 1;
    transform: none;
  }
}
.fadeInUp {
  animation-name: fadeInUp;
  animation-duration: 1s;
  animation-fill-mode: both;
}

@keyframes fadeIn {
  0% {
    transform: scale(0.8);
  }
  100% {
    opacity: 1;
    transform: scale(1);
  }
}
.fadeIn, .columns.sm-days {
  animation-name: fadeIn;
  animation-duration: 1s;
  animation-fill-mode: both;
}

.sm-days:nth-child(1) {
  animation-delay: 0.2s;
}

.sm-days:nth-child(2) {
  animation-delay: 0.4s;
}

.sm-days:nth-child(3) {
  animation-delay: 0.6s;
}

.sm-days:nth-child(4) {
  animation-delay: 0.8s;
}

.sm-days:nth-child(5) {
  animation-delay: 1s;
}

.sm-days:nth-child(6) {
  animation-delay: 1.2s;
}

.sm-days:nth-child(7) {
  animation-delay: 1.4s;
}
    </style>
<div class="modal modal-blur fade" id="modal-Weather" tabindex="-1"
	style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i class="fas fa-temperature-low" style="margin-right: 9px;"></i>시간별 날씨
				</h5>
				<button type="button" class="btn-close" data-dismiss="modal"
					aria-label="Close" onclick="window.location.reload()"></button>
			</div>
			<div class="modal-body">
				<div class="mb-3">
<section class="containers">

  <!-- Current Weather Details //-->
  <header>
    <div class="row">

      <div class="sm-four columns current-city-name">
        <h2>대전(Daejeon)</h2>
      </div>

      <div class="sm-four columns current-city-weather">
        <i class="wi wi-day-showers"></i>
      </div>

      <div class="sm-four columns current-city-temp">
        <h2><sup>o</sup>C</h2>
      </div>

      <span class="current-city-day"></span>

    </div>
  </header>
  <!--// End Current Weather Details -->

  <!-- Days //-->
  <section class="week-days">

    

  </section>
  <!--// End Days -->

</section>
					
					
				</div>
			</div>
		</div>
	</div>
</div>


