// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener("turbolinks:load", function () {
  $('.modal').modal();
  $(".brand-logo").sideNav();

  $('#search-bar').hide();

  $('#search-close').click(function hideSearchBar() {
    $('#default-navbar').show();
    $('#search-bar').hide();
  });

  $('#navbar-search-btn').click(function showSearchBar() {
    $('#default-navbar').hide();
    $('#search-bar').show();
    $('#search').focus();
  });
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

