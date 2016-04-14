//Canvas animation based on http://waynecater.wordpress.com/2011/02/07/html5-canvas-animation-overview/


function AnimateCanvas() {
    var width = 1440;
    var height = 500;

    var intCrowdY = 500;
    var intNameAlpha = 0;
    var intNameY = 84;
    var intNameCnt = 0;

    var crowdIntervalID;
    var brownIntervalID;
    var nameFadeIntervalID;
    var nameRotateIntervalID;

    //Load the image resources
    var imgBrown = new Image();
    var imgCrowd = new Image();
    var imgName = new Image();
    

    //Load the canvas references
    var layer1 = document.getElementById('canvas1'); //Name layer
    var context1 = layer1.getContext('2d');
    var layer2 = document.getElementById('canvas2'); //crowd layer
    var context2 = layer2.getContext('2d');
    var layer3 = document.getElementById('canvas3'); //brown layer
    var context3 = layer3.getContext('2d');

    function initImages() {
        imgBrown.src = "Content/images/bg-body-brown.png";
        imgBrown.onload = function () { brownIntervalID = setInterval(drawBrown(), 2); }
        imgCrowd.src = "Content/images/bg-body-crowd.png";
        imgName.src = "Content/images/bg-body-name.png";
    }

    function drawBrown() {
        //alert("brown");
        context3.clearRect(0, 0, width, height);
        context3.drawImage(imgBrown, 0, 335);
        clearInterval(brownIntervalID);
    }

    function drawCrowd() {
        crowdIntervalID = setInterval(function () {
            moveTheCrowd()
        }, 20);


    }

    function moveTheCrowd() {
        if (intCrowdY > 150) {
            intCrowdY -= 2;
            context2.clearRect(0, 0, width, height);
            context2.drawImage(imgCrowd, 85, intCrowdY);
        }
        else {
            clearInterval(crowdIntervalID);
            nameRotateIntervalID = setInterval(function () {
                moveName()
            }, 100);
        }
    }


    function drawName() {
        context1.globalAlpha = 0.01;
        context1.drawImage(imgName, 232, intNameY, 634, 48);

        nameFadeIntervalID = setInterval(function () {
            fadeInName()
        }, 125);

    }

    function fadeInName() {
        if (intNameAlpha < 1) {
            intNameAlpha += .25;
            context1.drawImage(imgName, 232, 84, 634, 48);
            context1.globalAlpha = intNameAlpha;
        }
        else {
            clearInterval(nameFadeIntervalID);
        }

    }

    function moveName() {
        intNameCnt ++;
        if (intNameY % 2 == 0) { intNameY -= 3; }
        else { intNameY += 3; }
        context1.clearRect(0, 0, width, height);
        context1.drawImage(imgName, 232, intNameY, 634, 48);
        if (intNameCnt > 5){ clearInterval(nameRotateIntervalID); }

    }

    function drawLayers() {

        
        setTimeout(drawCrowd, 1000);
        setTimeout(drawName, 5);
    }



    //drawBrown();
    initImages();
    drawLayers();

}

