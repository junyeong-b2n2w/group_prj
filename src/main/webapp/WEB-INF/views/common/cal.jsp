<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true"%>    

<style>
@import url("https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap");
* {
	box-sizing: border-box;
	user-select: none;
	font-family: Quicksand, Verdana, Geneva, Tahoma, sans-serif;
}
body {
	margin: 0;
	display: flex;
	height: 100vh;
	justify-content: center;
	overflow: hidden;
}
.container {
	min-height : 100%;
	width: 400px;
	max-width: 95%;
	height: 75vh;
	display: flex;
	flex-direction: column;
	border-radius: 10px;
	overflow: hidden;
	align-items: center;
	background-image: linear-gradient(to bottom, #555, #000);
}
.panels {
	width: 90%;
	min-height: 150px;
	height: 10%;
	display: flex;
	flex-direction: column;
	align-items: flex-end;
	justify-content: center;
	padding: 0 25px;
	text-align: end;
	border-bottom: 1px solid #6d6d6d;
	overflow: auto;
	overflow-y: hidden;
}
.panels .mainPanel {
	font-size: 3em;
	color: #fff;
	width: 100%;
}
.panels .secondPanel {
	font-size: 1em;
	color: #aaa;
	width: 100%;
	height: 20px;
	white-space: nowrap;
}
.buttons-grid {
	width: 100%;
	flex-grow: 1;
	display: grid;
	grid-template-columns: repeat(4, calc(100% / 4 - (30px / 4)));
	grid-template-rows: repeat(6, calc(100% / 6 - (50px / 6)));
	grid-template-areas: ". . . sum" "seven eight nine subtract" "four five six multiply" "one two three divide" "dot zero del result";
	padding: 10px;
	gap: 10px;
}
.buttons-grid > div {
	font-size: 2em;
	border-radius: 5px;
	color: #999;
	display: flex;
	align-items: center;
	justify-content: center;
}
.buttons-grid > div:hover {
	background-color: #333;
}
.buttons-grid > div[class^="num"]:hover {
	text-shadow: 0px 0px 20px #ffffff;
}
.sum {
	grid-area: sum;
}
.subtract {
	grid-area: subtract;
}
.multiply {
	grid-area: multiply;
}
.divide {
	grid-area: divide;
}
.result {
	grid-area: result;
}
.numNine {
	grid-area: nine;
}
.numEight {
	grid-area: eight;
}
.numSeven {
	grid-area: seven;
}
.numSix {
	grid-area: six;
}
.numFive {
	grid-area: five;
}
.numFour {
	grid-area: four;
}
.numThree {
	grid-area: three;
}
.numTwo {
	grid-area: two;
}
.numOne {
	grid-area: one;
}
.dot {
	grid-area: dot;
}
.numZero {
	grid-area: zero;
}
.del {
	grid-area: del;
}

.pow {
	font-size: 0.5em;
	position: relative;
	top: -10px;
}
.root {
	font-size: 0.5em;
	position: relative;
	top: -15px;
	right: -15px;
}
.buttons-grid > .special {
	color: #eee;
}
.buttons-grid > .classic {
	color: #ff6f6f;
}
.buttons-grid > .result {
	background-color: #ff6f6f;
	color: #fff;
	width: 55px;
	height: 55px;
	align-self: center;
	justify-self: center;
	border-radius: 50%;
	box-shadow: 0px 0px 10px 7px #ff7161;
}
.buttons-grid > .result:hover {
	background-color: #ff8484;
}

@media only screen and (max-width: 375px) {
	.buttons-grid > .special {
		font-size: 1.7em;
	}
	.buttons-grid div:hover {
		background-color: initial;
	}
	.buttons-grid div[class^="num"]:hover {
		text-shadow: initial;
	}
}

</style>

<body onkeydown="globalKey(event)">
	<main class="container">
		<header class="panels">
			<div class="secondPanel"></div>
			<div class="mainPanel">0</div>
		</header>
		<div class="buttons-grid">
			<div onclick="clearPanels()" class="special">C</div>
			<div onclick="operators('Mod')" class="special">Mod.</div>
			<div onclick="changeSign()" class="special">+/-</div>
			<div onclick="operators('+')" class="sum classic">&plus;</div>
			<div onclick="operators('-')" class="subtract classic">&minus;</div>
			<div onclick="operators('\u00D7')" class="multiply classic">&times;</div>
			<div onclick="operators('\u00F7')" class="divide classic">&divide;</div>
			<div onclick="result()" class="result">=</div>
			<div onclick="global(this)" class="numNine">9</div>
			<div onclick="global(this)" class="numEight">8</div>
			<div onclick="global(this)" class="numSeven">7</div>
			<div onclick="global(this)" class="numSix">6</div>
			<div onclick="global(this)" class="numFive">5</div>
			<div onclick="global(this)" class="numFour">4</div>
			<div onclick="global(this)" class="numThree">3</div>
			<div onclick="global(this)" class="numTwo">2</div>
			<div onclick="global(this)" class="numOne">1</div>
			<div onclick="dotChecker()" class="dot special">.</div>
			<div onclick="global(this)" class="numZero">0</div>
			<div onclick="delElement()" class="del special">&lArr;</div>
		</div>
	</main>
	<script>
	const panel = document.getElementsByClassName("mainPanel").item(0);
	const secondPanel = document.getElementsByClassName("secondPanel").item(0);
	const clearStorage = () => {
		mainArray = [];
		secondPanel.innerHTML = "";
		specialExist = false;
		showingError = false;
	};
	var mainArray = [];
	var showingResult = false,
		specialExist = false;
	showingError = false;
	function globalKey(event) {
		switch (event.key) {
			case "1":
				global(document.getElementsByClassName("numOne").item(0));
				break;
			case "2":
				global(document.getElementsByClassName("numTwo").item(0));
				break;
			case "3":
				global(document.getElementsByClassName("numThree").item(0));
				break;
			case "4":
				global(document.getElementsByClassName("numFour").item(0));
				break;
			case "5":
				global(document.getElementsByClassName("numFive").item(0));
				break;
			case "6":
				global(document.getElementsByClassName("numSix").item(0));
				break;
			case "7":
				global(document.getElementsByClassName("numSeven").item(0));
				break;
			case "8":
				global(document.getElementsByClassName("numEight").item(0));
				break;
			case "9":
				global(document.getElementsByClassName("numNine").item(0));
				break;
			case "0":
				global(document.getElementsByClassName("numZero").item(0));
				break;
			case ".":
				dotChecker();
				break;
			case "+":
				operators("+");
				break;
			case "-":
				operators("-");
				break;
			case "*":
				operators("\u00D7");
				break;
			case "/":
				operators("\u00F7");
				break;
			case "Enter":
				result();
				break;
			case "Backspace":
				delElement();
				break;
			case "c":
				clearPanels();
				break;
		}
	}

	function solver() {
		if (!specialExist) {
			secondPanel.innerHTML += panel.innerHTML;
			mainArray.push(panel.innerHTML);
		}
		specialExist = false;
		if (mainArray.length == 1) {
			return mainArray[0];
		}
		var result = 0;
		while (mainArray.length != 1) {
			var actualSign = mainArray[1];
			switch (actualSign) {
				case "+":
					result = Number(mainArray[0]) + Number(mainArray[2]);
					break;
				case "-":
					result = Number(mainArray[0]) - Number(mainArray[2]);
					break;
				case "\u00D7":
					result = Number(mainArray[0]) * Number(mainArray[2]);
					break;
				case "\u00F7":
					result = Number(mainArray[0]) / Number(mainArray[2]);
					break;
				case "Mod":
					result = Number(mainArray[0]) % Number(mainArray[2]);
					break;
				default:
					showingError = true;
					result = "NotAnOperator";
			}
			mainArray.splice(0, 3);
			mainArray.unshift(result);
		}
		return result;
	}

	function voidDecimalChecker() {
		var tempArray = secondPanel.innerHTML.split(" ").map((value) => {
			if (isNaN(Number(value))) {
				return value;
			}
			return Number(value);
		});
		for (var i = 1; i < tempArray.length; i += 2) {
			tempArray.splice(i, 0, " ");
		}
		secondPanel.innerHTML = tempArray.toString().replace(/,/g, "");
	}

	function clearPanels() {
		if (panel.innerHTML == "0" && secondPanel != "") {
			clearStorage();
		} else {
			(panel.innerHTML = "0"), (showingError = false);
		}
	}

	function delElement() {
		if (panel.innerHTML != "0" && panel.innerHTML.length != 1) {
			panel.innerHTML = panel.innerHTML
				.split("")
				.slice(0, panel.innerHTML.length - 1)
				.toString()
				.replace(/,/g, "");
		} else if (panel.innerHTML != "0") {
			panel.innerHTML = "0";
		}
	}

	function dotChecker() {
		if (secondPanel.innerHTML.includes("=")) {
			secondPanel.innerHTML = "";
		}
		if (showingResult) {
			clearPanels();
			showingResult = false;
		}
		if (!panel.innerHTML.includes(".")) {
			panel.innerHTML += ".";
		}
	}

	function changeSign() {
		if (showingResult) {
			clearStorage();
		}
		if (panel.innerHTML != "0") {
			panel.innerHTML = Number(panel.innerHTML) * -1;
		}
	}

	function global(element) {
		if (specialExist) {
			secondPanel;
		}
		if (secondPanel.innerHTML.includes("=")) {
			secondPanel.innerHTML = "";
			mainArray = [];
		}
		if (
			(element.innerHTML != "0" && panel.innerHTML == "0") ||
			showingResult == true
		) {
			panel.innerHTML = element.innerHTML;
			showingResult = false;
		} else if (panel.innerHTML != "0") {
			panel.innerHTML += element.innerHTML;
		}
	}

	function result() {
		if (!secondPanel.innerHTML.includes("=")) {
			panel.innerHTML = solver();
			secondPanel.innerHTML += " = ";
			showingResult = true;
		}
	}

	function operators(operator) {
		if (showingError) {
			clearPanels();
		}
		if (secondPanel.innerHTML != "" && !secondPanel.innerHTML.includes("=")) {
			panel.innerHTML = solver();
			secondPanel.innerHTML += " " + operator + " ";
			mainArray.push(operator);
			showingResult = true;
		} else {
			mainArray = [];
			mainArray.push(panel.innerHTML);
			secondPanel.innerHTML = panel.innerHTML;
			voidDecimalChecker();
			secondPanel.innerHTML += " " + operator + " ";
			mainArray.push(operator);
			panel.innerHTML = "0";
		}
	}

	function specialSolver(calc) {
		if (!secondPanel.innerHTML.includes(" ")) {
			clearStorage();
		}
		secondPanel.innerHTML.includes("=")
			? ((secondPanel.innerHTML = calc + "(" + panel.innerHTML + ")"),
			  (mainArray = []))
			: (secondPanel.innerHTML += calc + "(" + panel.innerHTML + ")");
		switch (calc) {
			case "fact":
				const fact = (num) =>
					num < 0 || !Number.isSafeInteger(Number(num))
						? ((showingError = true), "NotSupported")
						: num <= 1
						? 1
						: num * fact(num - 1);
				panel.innerHTML = fact(panel.innerHTML);
				break;
			case "1/":
				const frac1x = (num) => 1 / num;
				panel.innerHTML = frac1x(panel.innerHTML);
				break;
			case "sqr":
				panel.innerHTML = Math.pow(panel.innerHTML, 2);
				break;
			case "√":
				panel.innerHTML = Math.sqrt(panel.innerHTML);
				break;
			default:
				panel.innerHTML = "No_a_special_operator_detected";
				showingError = true;
		}
		mainArray.push(panel.innerHTML);
		showingResult = true;
		specialExist = true;
	}

	</script>
</body>

