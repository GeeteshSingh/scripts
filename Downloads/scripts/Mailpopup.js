// Create a new XMLHttpRequest object.
const xhr = new XMLHttpRequest();

// Open a GET request to the Gmail API.
xhr.open("GET", "https://www.googleapis.com/gmail/v1/users/me/messages");

// Set the authorization header.
xhr.setRequestHeader("Authorization", "Bearer YOUR_API_KEY");  //To use the script, you will need to replace YOUR_API_KEY with your Gmail API key. To get your Gmail API key, follow these steps:

// Send the request.
xhr.send();

// Listen for the response.
xhr.onload = function() {
  // Parse the JSON response.
  const response = JSON.parse(xhr.responseText);

  // Get the list of messages.
  const messages = response.messages;

  // Check if there are any new messages from "geetesh".
  for (const message of messages) {
    if (message.from === "geetesh") {
      // Create a new notification pop-up.
      const notification = new Notification("New email from geetesh!");

      // Set the notification's body.
      notification.body = message.subject;

      // Click the notification to open the email.
      notification.onclick = function() {
        window.open(`https://mail.google.com/mail/u/0/?tab=wm#inbox/${message.id}`);
      };
    }
  }
};