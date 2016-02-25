var newIdeaTitle, newIdeaBody, errorMessages;

$(document).ready(function () {
  newIdeaTitle = $('.new-idea-title');
  newIdeaBody = $('.new-idea-body');
  errorMessages = $('.new-idea-messages');

  $('.new-idea-submit').on('click', createIdea);
});

function createIdea(event) {
  event.preventDefault();
  clearErrors();
  IdeaRepository.create(getNewIdea())
                .fail(renderError);
}

function clearErrors() {
  return errorMessages.html('');
}

function getNewIdea() {
  return {
    title: newIdeaTitle.val(),
    body: newIdeaBody.val()
  }
}

function renderError() {
  errorMessages.text('Title and/or body cannot be blank.');
}
