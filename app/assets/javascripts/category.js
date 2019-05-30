$(document).on('turbolinks:load', function(){
  $(".header__container__left__category").hover(function () {
    $(this).children(".header__container__left__category__box").show();
      }, function(){
        $(this).children(".header__container__left__category__box").hide();
  });
});
