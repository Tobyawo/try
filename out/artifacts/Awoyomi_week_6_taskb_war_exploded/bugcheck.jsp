<!DOCTYPE html>
<html>
<head>

  <title>Connection</title>
  <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" sizes="16x16">
  <link rel="stylesheet" type="text/css" href="ember-style.css">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500&display=swap" rel="stylesheet">





</head>
<body>
<script type="text/x-handlebars" data-template-name="login">
		{{#topnav-comp}}
			{{#topnav-left-comp}}
				Connection
			{{/topnav-left-comp}}
			{{#topnav-right-comp}}
				<form {{action "login" on="submit"}}>
					<table>
						<thead>
							<tr>
								<td>Email</td>
								<td>Password</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>{{input type="text" id="loginemail" value=""}}</td>
								<td>{{input type="password" id="loginpassword" value=""}}</td>
								<td><button type="submit" class="btn login-btn">LogIn</button></td>
							</tr>
						</tbody>
					</table>
				</form>
			{{/topnav-right-comp}}
		{{/topnav-comp}}
		<section>
			<form {{ action "signup" on="submit"}} >
				<div class="signup-box">
					<div class="create">
						Create a new account
					</div>
					<div class="make">
						Make your own Network
					</div>
					{{input type="text" name="name" placeholder="Your Name*" id="signup-name" required=true}}
					{{input type="text" name="email" placeholder="Email Id*" id="signup-mail" required=true}}
					{{input type="password" name="password" placeholder="Password*" id="signup-password" required=true}}
					{{input type="password" name="confirmPassword" placeholder="Confirm Password*" id="signup-conPassword" required=true}}
					<button type="submit" name="action" class="signup-btn">Sign Up</button>
				</div>
			</form>
		</section>
	</script>

<script type="text/x-handlebars" id="components/topnav-comp">
		<div class="topnav">
			<div class="topnav_adjust">
				{{yield}}
			</div>
		</div>
	</script>

<script type="text/x-handlebars" id="components/topnav-left-comp">
		<div class="connection-space nav_align connection">{{yield}}</div>
	</script>

<script type="text/x-handlebars" id="components/topnav-right-comp">
		<div class="nav_align">
			{{yield}}
		</div>
	</script>

<script type="text/x-handlebars" data-template-name="navbar">
		{{#topnav-comp}}
			{{#topnav-left-comp}}
				Connection
			{{/topnav-left-comp}}
			{{#topnav-right-comp}}
				<div class="move-bar">
					{{#link-to 'userdetail' class="btn move-btn"}}
						My Profile
					{{/link-to}}
					{{#link-to 'homepage' class="btn move-btn"}}Home{{/link-to}}
					{{#link-to 'findfriends' class="btn move-btn"}}Find Friends{{/link-to}}
					{{#link-to 'logout' class="btn move-btn"}}Logout{{/link-to}}
				</div>
			{{/topnav-right-comp}}
		{{/topnav-comp}}
	</script>

<script type="text/x-handlebars" data-template-name="homepage">
		{{render 'navbar'}}
		<div class="add-top">
			<form enctype="multipart/form-data" {{action "addNewPost" on="submit"}} id="newPostForm">
				<section class="post-box">
					{{textarea rows=8 class="addpost" placeholder="Write Somthing..." id="newPost" required=true}}
					<div class="post_image">
						<label for="file-upload" class="custom-file-upload">+ Photo/Video</label>
						<input id="file-upload" type="file" name="postFile" accept="vedio/*,image/*" onchange="readURL(this);">
						<img src="" style="display: none;" id="selectedImage">
						<video controls controlsList="nodownload" style="display: none;" id="videoTag" autoplay>
							<source src="" type="video/mp4" id="selectedVideo">
						</video>
					</div>
					<hr>
					<div class="post-align">
						<button type="submit" class="btn">Post</button>
					</div>
				</section>
			</form>
			{{#each post in model}}
				<div class="post-box" {{bind-attr id=post.postId}}>
					<div class="post-flex">
						<div class="poster-img">
							{{#if post.profilePicPath}}
								<img {{bind-attr src=post.profilePicPath}}>
							{{else}}
								<img src="appImages/UnknownProfile.jpg">
							{{/if}}
						</div>
						<div>
							<div class="poster-name">
								{{post.userName}}
							</div>
							<div>
								{{duration-date-format post.timestamp}}.
							</div>
						</div>
					</div>
					<div class="post_content">
						<div class="post_content_text">
							{{post.content}}
						</div>
						<div class="post-file">
							{{#if post.postFilePath}}
								{{#if post.isImage}}
									<img {{bind-attr src="post.filePath"}}>
								{{else}}
									<div class="video-wrap">
										<video autoplay onmouseover="oncontrol(this)" onmouseout="offcontrol(this)" muted="true" controlsList="nodownload">
											<source {{bind-attr src="post.filePath"}} type="video/mp4">
										</video>
									</div>
								{{/if}}
							{{/if}}
						</div>
						<div>
							{{#link-to class="like-count"}}
								<span {{bind-attr id=post.likeCountId}}>
									{{post.likeCount}}
								</span>
								<span>Likes</span>
							{{/link-to}}
						</div>
						<hr>
						<section class="like-comment">
							<div class="like-btn">
								<button {{bind-attr id=post.addLikeId}} {{action "addOrRemoveLike" post.postId}}>
									<img src="images/like.png" alt="like"><span class="like-word">Like</span>
								</button>
							</div>
							<div class="like-btn" >
								<button type="button" {{action 'fetchComments' post.postId post.userId post}}>
									<img src="images/comment.png" alt="like">
									<span class="like-word">Comment</span>
								</button>
							</div>
						</section>
						<hr>
						<section class="add-comment">
							{{textarea rows=1 placeholder="Write Your Thoughts.." class="comment-box" id=post.addCommentId }}
							<div>
								<button class="post-btn" {{action "addComment" post.postId post.userId 0}} >Post</button>
							</div>
						</section>
						<section class="old-comment" {{bind-attr id=post.postId}}>
							{{#if post.isCommentSelected}}
								<hr>
								<div class="comment">
									{{post.comments.length}} Comments
								</div>
								{{#each comment in post.comments}}
									<div class="comments">
										<div class="dim">
											<div class="friend-img">
												{{#if comment.commentePubPicPath}}
													<img {{bind-attr src=comment.commentePubPicPath}} class="add-pad">
												{{else}}
													<img src="appImages/UnknownProfile.jpg" class="add-pad">
												{{/if}}
											</div>
											<div class="dong">
												<div class="comment-name">
													{{comment.commentPublisherName}}
												</div>
												<div>
													{{duration-date-format comment.commentTime}}
												</div>
											</div>
										</div>
										<div class="comment-content">
											{{comment.commentContent}}
										</div>
									</div>
								{{/each}}
							{{/if}}
						</section>
					</div>
				</div>
			{{/each}}
		</div>
	</script>

<script type="text/x-handlebars" data-template-name="findfriends">
		{{partial 'navbar' }}
		<section class="cover add-top2">
			<div class="friend_header">
				<div class="friend_header_inner">
					<img src="appImages/FriendsIcon.png">
					<div class="naming">
						Friend Sugestions
					</div>
				</div>
			</div>
		</section>
		<div class="findfriend">
			{{#each friend in model}}
				<div {{bind-attr id=friend.addFriendId}}>
					<div class="friend-flex-upper" >
						<div class="friend-flex">
							<div class="friend-img">
								{{#if post.friendProfilePath}}
									<img {{bind-attr src=post.friendProfilePath}}>
								{{else}}
									<img src="appImages/UnknownProfile.jpg">
								{{/if}}
							</div>
							<div>
								<div class="friend-name">
									{{friend.friendName}}
								</div>
								{{friend.friendWork}}
							</div>
						</div>
						<div class="">
							<button class="btn addfriend" {{action "addFriend" friend.friendId}}>Add Friend</button>
						</div>
					</div>
					<hr>
				</div>
			{{/each}}
		</div>
	</script>

<script type="text/x-handlebars" data-template-name="userdetail">
		{{render 'navbar'}}
		<div class="profile-top add-top3">
			{{#each detail in model}}
				<div class="cover-pic">
					{{#if detail.userCoverPicPath}}
						<img {{bind-attr src=detail.userCoverPicPath}} class="cover-pic">
					{{else}}
						<img src="appImages\DefaultCoverProfile.jpg" class="cover-pic">
					{{/if}}
					<div class="bottom-left">
						{{#if detail.userProfilePicPath}}
							<img {{bind-attr src=detail.userProfilePicPath}} class="profile-pic">
						{{else}}
							<img src="appImages/UnknownProfile.jpg" class="profile-pic">
						{{/if}}
					</div>
					<div class="bottom-left name">{{detail.userName}}</div>
					<div class="profile-moving">
						<div class="tt">{{#link-to "" class="profile-moving-btn"}}About{{/link-to}}</div>
						<div class="tt">{{#link-to "myfriend" class="profile-moving-btn" }}Friends{{/link-to}}</div>
						<div class="tt">{{#link-to "mypost" class="profile-moving-btn" }}Posts{{/link-to}}</div>
					</div>
				<div>
			{{/each}}
			{{outlet}}
		</div>
	</script>

<script type="text/x-handlebars" data-template-name="myfriend">
		<section class="mr cover">
			<div class="friend_header">
				<div class="friend_header_inner">
					<img src="appImages/FriendsIcon.png" class="name-ff">
					<div class="naming name-ff">
						Friends
					</div>
					<div class="ff">
						{{#link-to "findfriends" class="ff-link"}}Find Friend{{/link-to}}
					</div>
				</div>
			</div>
		</section>
		<section class="bg">
			{{#each friend in  model}}
				<div class="friend-flex-upper" >
					<div class="friend-flex">
						<div class="friend-img">
							{{#if friend.friendProfilePath}}
								<img {{bind-attr src=friend.friendProfilePath}}>
							{{else}}
								<img src="appImages/UnknownProfile.jpg">
							{{/if}}
						</div>
						<div>
							<div class="friend-name">
								{{friend.friendName}}
							</div>
							{{friend.friendWork}}
						</div>
					</div>
				</div>
				<hr>
			{{/each}}
		</section>
	</script>

<script type="text/x-handlebars" data-template-name="mypost">
		<section class="profile-bottom split">
			<section class="quick-link">
			</section>
			<section>
				<form enctype="multipart/form-data" {{action "addNewPost" on="submit"}} id="newPostForm">
					<section class="profile_post-box">
						{{textarea rows=8 class="addpost" placeholder="Write Somthing..." id="newPost" required=true}}
						<div class="post_image">
							<label for="file-upload" class="custom-file-upload">+ Photo/Video</label>
							<input id="file-upload" type="file" name="postFile" accept="vedio/*,image/*" onchange="readURL(this);">
							<img src="" style="display: none;" id="selectedImage">
							<video controls controlsList="nodownload" style="display: none;" id="videoTag" autoplay>
								<source src="" type="video/mp4" id="selectedVideo">
							</video>
						</div>
						<hr>
						<div class="post-align">
							<button type="submit" class="btn">Post</button>
						</div>
					</section>
				</form>
				{{#each post in model}}
					<div class="profile_post-box" {{bind-attr id=post.postId}}>
						<div class="post-flex">
							<div class="poster-img">
								{{#if post.profilePicPath}}
									<img {{bind-attr src=post.profilePicPath}}>
								{{else}}
									<img src="appImages/UnknownProfile.jpg">
								{{/if}}
							</div>
							<div>
								<div class="poster-name">
									{{post.userName}}
								</div>
								<div>
									{{duration-date-format post.timestamp}}.
								</div>
							</div>
						</div>
						<div class="post_content">
							<div class="post_content_text">
								{{post.content}}
							</div>
							<div class="profile-post-file">
								{{#if post.postFilePath}}
									{{#if post.isImage}}
										<img {{bind-attr src="post.filePath"}}>
									{{else}}
										<div class="video-wrap">
											<video autoplay onmouseover="oncontrol(this)" onmouseout="offcontrol(this)" muted="true" controlsList="nodownload">
												<source {{bind-attr src="post.filePath"}} type="video/mp4">
											</video>
										</div>
									{{/if}}
								{{/if}}
							</div>
							<div>
								{{#link-to class="like-count"}}
									<span {{bind-attr id=post.likeCountId}}>
										{{post.likeCount}}
									</span>
									<span>Likes</span>
								{{/link-to}}
							</div>
							<hr>
							<section class="like-comment">
								<div class="like-btn">
									<button {{bind-attr id=post.addLikeId}} {{action "addOrRemoveLike" post.postId}}>
										<img src="images/like.png" alt="like"><span class="like-word">Like</span>
									</button>
								</div>
								<div class="like-btn" >
									<button type="button" {{action 'fetchComments' post.postId post.userId post}}>
										<img src="images/comment.png" alt="comment">
										<span class="like-word">Comment</span>
									</button>
								</div>
							</section>
							<hr>
							<section class="add-comment">
								{{textarea rows=1 placeholder="Write Your Thoughts.." class="comment-box" id=post.addCommentId }}
								<div>
									<button class="post-btn" {{action "addComment" post.postId post.userId 0}} >Post</button>
								</div>
							</section>
							<section class="old-comment" {{bind-attr id=post.postId}}>
								{{#if post.isCommentSelected}}
									<hr>
									<div class="comment">
										{{post.comments.length}} Comments
									</div>
									{{#each comment in post.comments}}
										<div class="comments">
											<div class="dim">
												<div class="friend-img">
													{{#if comment.commentePubPicPath}}
														<img {{bind-attr src=comment.commentePubPicPath}} class="add-pad">
													{{else}}
														<img src="appImages/UnknownProfile.jpg" class="add-pad">
													{{/if}}
												</div>
												<div class="dong">
													<div class="comment-name">
														{{comment.commentPublisherName}}
													</div>
													<div>
														{{duration-date-format comment.commentTime}}
													</div>
												</div>
											</div>
											<div class="comment-content">
												{{comment.commentContent}}
											</div>
										</div>
									{{/each}}
								{{/if}}
							</section>
						</div>
					</div>
				{{/each}}
			</section>
		</section>


</script>

<script src="js/libs/jquery-1.11.2.min.js"></script>
<script src="js/libs/handlebars-v1.3.0.js"></script>
<script src="js/libs/ember.min.js"></script>
<script src="js/libs/ember-data.js"></script>
<script src="js/libs/moment.min.js"></script>
<script src="js/app.js"></script>
<script src="js/router.js"></script>
<script src="js/common.js"></script>

<script src="js/routes/homepage.js"></script>
<script src="js/routes/userdetail.js"></script>
<script src="js/routes/findfriends.js"></script>
<script src="js/routes/myfriend.js"></script>
<script src="js/routes/mypost.js"></script>
<script src="js/routes/fetchcomment.js"></script>
<script src="js/routes/logout.js"></script>

<script src="js/models/homepage.js"></script>
<script src="js/models/userdetail.js"></script>
<script src="js/models/findfriends.js"></script>
<script src="js/models/fetchcomment.js"></script>
<script src="js/models/myfriend.js"></script>
<script src="js/models/mypost.js"></script>

<script src="js/controllers/login.js"></script>
<script src="js/controllers/homepage.js"></script>
<script src="js/controllers/userdetail.js"></script>
<script src="js/controllers/findfriends.js"></script>

<script src="js/helpers/dateformat.js"></script>
<script src="js/helpers/pathsimplifier.js"></script>




</body>
</html>