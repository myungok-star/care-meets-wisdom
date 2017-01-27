 You need to adopt a strong adherence to convention. Your lack of indentation makes it extremely hard to read your code.  Please keep indentation to two spaces per 'tab' and make sure your closing tags match the same position as your opening tags.  

 Do not call controller helpers in your view files.  This is not considered a good separation of concerns.  Instead assign instance variables the return values of controller helpers.   We shouldn't see any variables in your view without the @ prefix.

Your controllers seem to be overloaded with too many instance variables.  Verify that you truly do need all of the @variables that you have called.  

 Do not hot-link images from other sites onto your page.  You have a mature rails application; you NEED to put your images in your own application.  Your use of their images are costing them bandwidth, which means you cost them money.  
