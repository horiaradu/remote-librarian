// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function () {
  // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
  $('.modal').modal();
});

$(document).on('click', '.delete-book-btn', function openDeleteConfirmationModal(event) {
  var bookId = $(this).data('id');
  var bookTitle = $(this).data('title');
  $("#delete-book-link").attr('href', '/books/' + bookId);
  $("#delete-book-title").text(bookTitle);

  $('#delete-confirm-modal').modal('open');
  return true;
});

