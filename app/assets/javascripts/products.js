$(document).ready(function(){
	$(".product-like").click(function(){
		set_heart_color(this);
	});



});


function set_heart_color(elem){
	var producto = $(elem).parent().parent().find('.producto-id').text();
    console.log(producto);
    console.log(<%= current_user.id %>);
	if($(elem).is('.fa-heart-o')){
		$(elem).removeClass('fa-heart-o').addClass('fa-heart');
		
		save_association_product_user(producto);
	}else{
		$(elem).removeClass('fa-heart').addClass('fa-heart-o');
		destroy_association_product_user(producto);
	}
}


	function save_association_product_user(producto){
	 $.ajax({
        url:'/ecommerce/product_like',
        type:'POST',
        data:{
            myparam1: <%= current_user.id %>,
            myparam2: producto,
        },
        success:function(data){
            console.log("success");
        },
        error:function(data){
            debugger;
        }
    });
	}


	function destroy_association_product_user(producto){
	 $.ajax({
        url:'/ecommerce/destroy_product_like',
        type:'POST',
        data:{
            myparam1: <%= current_user.id %>,
            myparam2: producto,
        },
        success:function(data){
            console.log("success");
        },
        error:function(data){
            debugger;
        }
    });
	}