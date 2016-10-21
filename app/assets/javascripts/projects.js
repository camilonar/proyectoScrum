app.Proyectos = function() {
  this._input = $('#users-search-txt');
  this._initAutocomplete();
};

app.Proyectos.prototype = {
  _initAutocomplete: function() {
    this._input
      .autocomplete({
        source: '/projects/search',
        appendTo: '#users-search-results',
        select: $.proxy(this._select, this)
      })
      .autocomplete('instance')._renderItem = $.proxy(this._render, this);
  },

  _render: function(ul, item) {
    var markup = [
      '<span class="title">' + item.proy_nombre + ' </span>',
      '<span class="title">' + item.proy_estado + ' </span>',
    ];
    return $('<li>')
      .append(markup.join(''))
      .appendTo(ul);
  },

  _select: function(e, ui) {
    this._input.val(ui.item.proy_nombre + ' - ' + ui.item.proy_estado);
    return false;
  }
};