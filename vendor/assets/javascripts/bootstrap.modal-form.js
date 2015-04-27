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
        },

        load: function(url) {
            $.ajax({
                url: url,
                accepts: this.settings.ajax.accepts,
                dataType: this.settings.ajax.dataType,
                beforeSend: this.addLoader,
                success: this.addContent,
                error: function() { alert('Error occured'); }
            })
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

        $('[data-target=' + this.selector + ']')//.filter('[data-toggle="modal"]')
            .on('click', function(e) {
                e.preventDefault();
                var url = $(this).data('href') || $(this).attr('href');
                modalForm.load(url);
            });
        //return this;
    };


}(jQuery));