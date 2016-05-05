var speed = 500;
var direction = "left";
var tailLength = 1;
var snakeHeadElementId = 'snake-head';
var tailElements = 'snake-tail';
var snakeElement = {"direction" = "left",
					position = {"X" = 0, "Y" = 0}
					};

$(document).ready(
		function () {
			// initial direction
			direction = "left";

			moveSnake = setInterval(function(){move()}, speed);
			
			for (var idx = 0; idx < tailLength; idx++) {
				appendToTail(idx);
			}
});

var appendToTail = function (i) {
	var currElemId = tailElements + '-' + toString(i);
	var prevElemId = snakeHeadElementId;
	
	if (i > 0) {
		prevElemId = tailElements + '-' + toString(parseInt(i) - 1);
	}
	
	var posX = $('#' + prevElemId).position().left;
	var posY = $('#' + prevElemId).position().left;
	
	if (parseInt(posX) - 20 < 0) {
		posY = parseInt(posY) + 20;
	}
	
	if (parseInt(posX) - 20 < 0) {
		
	}
}

$(document).on('keypress', function(e) {
   switch (e.keyCode) {
		case 100 :
			if (direction !== "right") {
				direction = "left";
			}
			break;
		case 97 :
			if (direction !== "left") {
				direction = "right";
			}
			break;
		case 119 :
			if (direction !== "down") {
				direction = "up";
			}
			break;	
		case 115 :
			if (direction !== "up") {
				direction = "down";
			}
			break;
	}
});

var move = function() {
	switch (direction) {
		case "left" :
			moveLeft();
			break;
		case "right" :
			moveRight();
			break;
		case "up" :
			moveUp();
			break;	
		case "down" :
			moveDown();
			break;
	}
}

var moveLeft = function() {
	var posX = $('#' + snakeHeadElementId).position().left;
	if (posX <= 380) {
		$('#' + snakeHeadElementId).animate({"left": "+=20"},speed);
	} else {
		endGame();
	}
}

var moveRight = function() {
	var posX = $('#' + snakeHeadElementId).position().left;
	if (posX >= 0) {
		$('#' + snakeHeadElementId).animate({"left": "-=20"},speed);
	} else {
		endGame();
	}
}

var moveUp = function() {
	var posY = $('#' + snakeHeadElementId).position().top;
	if (posY >= 0) {
		$('#' + snakeHeadElementId).animate({"top": "-=20"},speed);
	} else {
		endGame();
	}
}

var moveDown = function() {
	var posY = $('#' + snakeHeadElementId).position().top;
	if (posY <= 380) {
		$('#' + snakeHeadElementId).animate({"top": "+=20"},speed);
	} else {
		endGame();
	}
}

var endGame = function (){
	window.clearInterval(moveSnake);
	alert("Game Over");
}