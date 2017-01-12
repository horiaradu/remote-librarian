// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener("turbolinks:load", function () {
  $('.modal').modal();
});

$(document).on('click', '.delete-book-btn', function openDeleteConfirmationModal(event) {
  event.preventDefault();
  event.stopPropagation();

  var bookId = $(this).data('id');
  var bookTitle = $(this).data('title');
  $("#delete-book-link").attr('href', '/books/' + bookId);
  $("#delete-book-title").text(bookTitle);

  $('#delete-confirm-modal').modal('open');
  return true;
});

