module BooksHelper
  def page_navigation_links(pages)
    will_paginate(pages,
                  class: 'pagination',
                  inner_window: 2,
                  outer_window: 0,
                  renderer: PaginationRenderer,
                  previous_label: '<i class="material-icons">chevron_left</i>'.html_safe,
                  next_label: '<i class="material-icons">chevron_right</i>'.html_safe)
  end
end
