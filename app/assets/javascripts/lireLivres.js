function createCookie(name,value,days) {
	if (days) {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}

function eraseCookie(name) {
	createCookie(name,"",-1);
}

if(readCookie("lu_s"+user_name)==null) {
    dialog = $( "#dialog-form" ).dialog({
      autoOpen: true ,
      height: 150,
      width: 350,
      modal: true,
      buttons: {
        "Ok": function() { document.forms[ "read_more_form" ].submit(); },
        "J'ai déjà lu suffisamment": function() {
	  createCookie("lu_s"+user_name,"ok",365);
          dialog.dialog( "close" );
        }
      }
    });
}

else {
    dialog = $( "#dialog-form" ).dialog({ 
	autoOpen: false, 
        height: 150,
        width: 350,
        modal: true,
    });

    document.getElementById('dialog-form').style.display="none";
}
