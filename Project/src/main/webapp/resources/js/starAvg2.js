function drawStar2(avgScore, parent) {
	var tempavg = avgScore;
	var tempparent = parent
	console.log('avg: ' + tempavg);
	if(tempavg == NaN){
		tempparent.css({
			width: "0px"
		});
	}
	else if(tempavg == 0){
		tempparent.css({
			width: "0px"
		});
	} else if(tempavg > 0 && tempavg <=1){
		tempparent.css({
			width: "8px",
			"z-index" : "10"
		});
	}else if(tempavg > 1 && tempavg <=2){
		tempparent.css({
			width: "16px",
			"z-index" : "9"
		});
	} else if(tempavg > 2 && tempavg <=3){
		tempparent.css({
			width: "24px",
			"z-index" : "8"
		});
	} else if(tempavg > 3 && tempavg <=4){
		tempparent.css({
			width: "32px",
			"z-index" : "7"
		});
	} else if(tempavg > 4 && tempavg <=5){
		tempparent.css({
			width: "40px",
			"z-index" : "6"
		});
	} else if(tempavg > 5 && tempavg <=6){
		tempparent.css({
			width: "48px",
			"z-index" : "5"
		});
	} else if(tempavg > 6 && tempavg <=7){
		tempparent.css({
			width: "56px",
			"z-index" : "4"
		});
	} else if(tempavg > 7 && tempavg <=8){
		tempparent.css({
			width: "64px",
			"z-index" : "3"
		});
	} else if(tempavg > 8 && tempavg <=9){
		tempparent.css({
			width: "72px",
			"z-index" : "2"
		});
	} else if(tempavg > 9 && tempavg <=10){
		tempparent.css({
			width: "80px",
			"z-index" : "1"
		});
	}
} // drawStar
