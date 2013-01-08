function getParms() {
    var params = {};
    var param_array = window.location.href.split('?')[1].split('&');
    for (var i in param_array) {
        x = param_array[i].split('=');
        params[x[0]] = x[1];
    }
    return params;
}

function setCookie(c_name,value,exdays) {
    var exdate=new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
    document.cookie=c_name + "=" + c_value;
}

function getCookie(c_name) {
    var i,x,y,ARRcookies=document.cookie.split(";");
    for (i=0;i<ARRcookies.length;i++){
        x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
        y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
        x=x.replace(/^\s+|\s+$/g,"");
        if (x==c_name){
            return unescape(y);
        }
    }
}


var jezik = getParms()["jezik"]
if (jezik == null) {
    setCookie("jezik", "sl", 10);
} else {
    if (jezik == "en") {
        setCookie("jezik", "en", 10);
    } else if (jezik == "si") {
        setCookie("jezik", "sl", 10);
    }
}

window.location = "index.html";