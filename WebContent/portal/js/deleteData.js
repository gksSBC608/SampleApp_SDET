function deleteRequests(request)
{
 var dataId = request.id;
 var dataValue = request.dataset['id'];

 if(confirm("Delete "+dataValue+" 's Requests") == true)
	 {
	 window.location.href = "deleteRequest.admin?requestId="+dataId;
	 }
 

}

function deleteUser(user)
{
	var dataId = user.id;
	 var dataValue = user.dataset['id'];
	 if(confirm("Delete "+dataValue+" 's Profile") == true)
		 {
		 window.location.href = "deleteUser.admin?loginEmail="+dataId;
		 }
	 

}

function deleteBulletin(bulletin)
{
	var dataId = bulletin.id;
	
	 if(confirm("Delete Bulletin") == true)
		 {
		 window.location.href = "bulletinHandler.admin?action=delete&id="+dataId;
		 }

}



function deleteVideo(video)
{
	var dataId = video.id;
	 var dataValue = video.dataset['id'];

	 if(confirm("Delete "+dataValue) == true)
		 {
		 window.location.href = "deleteVideo.admin?videoId="+dataId;
		 }

}