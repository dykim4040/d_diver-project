function drawStar(avg) {
	var tempavg = avg;
	console.log('avg: ' + tempavg);
	if(tempavg == null){
		$('.rat').css({
			width: "0px"
		});
	}
	else if(tempavg == 0){
		$('.rat').css({
			width: "0px"
		});
	} else if(tempavg > 0 && tempavg <=1){
		$('.rat').css({
			width: "8px",
			"z-index" : "10"
		});
	}else if(tempavg > 1 && tempavg <=2){
		$('.rat').css({
			width: "16px",
			"z-index" : "9"
		});
	} else if(tempavg > 2 && tempavg <=3){
		$('.rat').css({
			width: "24px",
			"z-index" : "8"
		});
	} else if(tempavg > 3 && tempavg <=4){
		$('.rat').css({
			width: "32px",
			"z-index" : "7"
		});
	} else if(tempavg > 4 && tempavg <=5){
		$('.rat').css({
			width: "40px",
			"z-index" : "6"
		});
	} else if(tempavg > 5 && tempavg <=6){
		$('.rat').css({
			width: "48px",
			"z-index" : "5"
		});
	} else if(tempavg > 6 && tempavg <=7){
		$('.rat').css({
			width: "56px",
			"z-index" : "4"
		});
	} else if(tempavg > 7 && tempavg <=8){
		$('.rat').css({
			width: "64px",
			"z-index" : "3"
		});
	} else if(tempavg > 8 && tempavg <=9){
		$('.rat').css({
			width: "72px",
			"z-index" : "2"
		});
	} else if(tempavg > 9 && tempavg <=10){
		$('.rat').css({
			width: "80px",
			"z-index" : "1"
		});
	}
} // drawStar
