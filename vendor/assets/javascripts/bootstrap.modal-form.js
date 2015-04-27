(function($) {
    "use strict";

    var modalForm = {
        settings: {},
        addLoader: function() {
        },
        removeLoader: {
        },
        addContent: function(data) {
            modalForm.modal.find(modalForm.settings.selector.content).html(data);
            modalForm.modal.modal('show');
            modalForm.modal.trigger('content-ready.bs.modal')
        },
        submit: function(url, data, method) {
            $.ajax({
                url: url,
                method: method,
                data: data,
                context: this,
                accepts: this.settings.ajax.accepts,
                dataType: this.settings.ajax.dataType,
                beforeSend: this.addLoader,
                success: this.addContent,
                statusCode: {
                    422: function(data) {
                        modalForm.addContent(data.responseText);
                    }
                }
            })
        },
        load: function(url) {
            $.ajax({
                url: url,
                accepts: this.settings.ajax.accepts,
                dataType: this.settings.ajax.dataType,
                beforeSend: this.addLoader,
                success: this.addContent,
                error: this.error
            })
        },

        error: function() {
            this.addContent('Some error occurred');
        },

        refreshPage: function() {
            document.location.reload();
        }
    };

    $.fn.modalForm = function(options) {
        modalForm.modal = this;
        modalForm.settings = $.extend({
            ajax: {
                accepts: {
                    html: 'text/javascript'
                },
                dataType: 'html'
            },
            selector: {
                content: '.modal-content'
            },
            callbacks: {
                beforeAjax: modalForm.addLoader
            }
        }, options);

        var targetLink = '[data-target=' + this.selector + ']';
        $(document).on('click', targetLink, function(e) {
                e.preventDefault();
                var url = $(this).data('href') || $(this).attr('href');
                modalForm.load(url);
            });

        $(document).on('submit', this.find('form'), function(e) {
            e.preventDefault();
            var form = e.target;
            var url = $(form).attr('action');
            modalForm.submit(url, $(form).serialize(), e.target.method);
        });
        //return this;
    };


}(jQuery));