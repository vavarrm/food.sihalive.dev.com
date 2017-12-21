
// javascript document
// This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
    if (response.status === 'connected') {
        // Logged into your app and Facebook.
		switch(fbAction)
		{
			case 'FBreg' :
				FBreg(response);
			break;
			case 'FBLogin':
				FBLogin(response);
			break;
		}
    } else if (response.status === 'not_authorized') {
		
        // The person is logged into Facebook, but not your app.
    } else {
        // The person is not logged into Facebook, so we're not sure if
        // they are logged into this app or not.
    }
}


function checkLoginState() {
    FB.getLoginStatus(function(response) {
        statusChangeCallback(response);
    });
}

window.fbAsyncInit = function() {
    FB.init({
        appId      : fbAppId ,
        cookie     : true, 
        xfbml      : true, 
        version    : 'v2.2' 
    });
};

(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) return;
	js = d.createElement(s); js.id = id;
	js.src = "//connect.facebook.net/zh_TW/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, "script", "facebook-jssdk"));



function FBreg(token) {
	var postdata =token.authResponse;
	$.ajax({
		type: 'post',
		dataType: 'json',
		url: FBRegApi,
		data: JSON.stringify(postdata),
		contentType: "application/json",
		success: function (data) {
			if(data.status =="200")
			{
				var sess = data['body']['sess'];
				$.cookie('sess', sess, { path: '/' });
				var obj = {
					message :js_user_registration_ok,
					buttons: 
					[
						{
						  text: "OK",
						  click: function() {
							$( this ).dialog( "close" );
							window.location.href="/";
						  }
						}
					]
				}
				dialog(obj)
			}else{
				var obj = {
					message :data.message
				};
				dialog(obj)
			}
		},
		error: function (data) {
			var obj = {
					message :js_response_error
			}
			dialog(obj)
		}
	});
}

function FBLogin(token)
{
	var postdata =token.authResponse;
	$.ajax({
		type: 'post',
		dataType: 'json',
		url: FBLoginApi,
		data: JSON.stringify(postdata),
		contentType: "application/json",
		success: function (data) {
			if(data.status =="200")
			{
				var sess = data['body']['sess'];
				$.cookie('sess', sess, { path: '/' });
				var obj = {
					message :js_user_login_ok,
					buttons: 
					[
						{
						  text: "OK",
						  click: function() {
							$( this ).dialog( "close" );
							location.href="/"+url_back;
						
						  }
						}
					]
				}
				dialog(obj)
			}else{
				var obj = {
					message :data.message
				};
				dialog(obj)
			}
		},
		error: function (data) {
			var obj = {
					message :js_response_error
			}
			dialog(obj)
		}
	});
}

function fbLogin()
{
    // FB 第三方登入，要求公開資料與email
    FB.login(function(response)
    {
        statusChangeCallback(response);
    }, {scope: 'public_profile,email'});
}
