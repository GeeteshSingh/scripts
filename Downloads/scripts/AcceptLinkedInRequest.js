// Get all of the LinkedIn invitation buttons.
const invitationButtons = document.querySelectorAll(".invitation-button");

// Get all of the LinkedIn connection buttons.
const connectionButtons = document.querySelectorAll(".connection-button");

// Create a function to accept invitations and connections.
const acceptInvitationsAndConnections = async () => {
  // Loop through the invitation buttons and click on each one.
  for (const invitationButton of invitationButtons) {
    await invitationButton.click();
  }

  // Loop through the connection buttons and click on each one.
  for (const connectionButton of connectionButtons) {
    await connectionButton.click();
  }

  // Wait for the invitations and connections to be accepted.
  await new Promise((resolve) => setTimeout(resolve, 1000));
};

// Accept invitations and connections.
acceptInvitationsAndConnections();
