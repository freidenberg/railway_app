module HomeHelper
    def post_image_url(post_image)
      "/post_images/#{post_image.file_name}"
    end
end
