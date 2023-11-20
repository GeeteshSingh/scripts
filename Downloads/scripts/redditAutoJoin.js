/* 1. Go to https://old.reddit.com/subreddits/ on your old account.
2. Under Home Feed Subreddits, click on the multireddit of your subscriptions link.
3. This will give you a link address like this: https://old.reddit.com/r/[reddit1+reddit2+....+N].
NOTE:: If you have a lot of subreddits, the link may not work because there is a limit to the link's length. 
In this case, simply split the link into two or three links.
4. Go to the link (or links) on your new account.
5. Open the browser console by pressing F12 and then clicking the Console tab.
6. Paste the following code into the console and press 
Enter: 
*/

const sub = () => {
	let btn = document.querySelector(".add.active");
	if(btn) {
		btn.click();
		setTimeout('sub()', 500);
	} else {
		alert("You have subscribed to all the subreddits successfully");
		return;
	}
}
setTimeout('sub()', 500);

//7. This will subscribe you to all of the subreddits on the page.

//Vice versa if you wanna remove all the reddits from your old account then enter this:

const remove = () => {
  let btn = document.querySelector(".remove.active");
  if (btn) {
    btn.click();
    setTimeout("remove()", 500);
  } else {
    alert("You have removed all the subreddits successfully");
    return;
  }
};
setTimeout("remove()", 500);
