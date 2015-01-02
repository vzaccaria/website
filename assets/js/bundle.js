
var fs = require('fs');
var profile_pic = fs.readFileSync(__dirname + '/assets/img/profile_pic_1_res.jpg', 'base64');
var sidebar_pic = fs.readFileSync(__dirname + '/assets/img/sidebar_picture.jpg', 'base64');
$(function() {
	$("img.bio__picture").attr("src", "data:image/jpg;base64," + profile_pic);
	$("img.sidebar__picture").attr("src", "data:image/jpg;base64," + sidebar_pic);
})
