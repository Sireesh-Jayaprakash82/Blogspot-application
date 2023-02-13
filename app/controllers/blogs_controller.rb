class BlogsController < ApplicationController
  before_action :find_blog, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  def index
    @blog = Blog.order(created_at: :desc)
    # @blog = current_user.blogs.build
  end

  def new
    @blog = current_user.blogs.build
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
    render turbo_stream: 
      [                
      turbo_stream.append('blog_display',
      partial: "blogs/blog_name",
      locals: { blog: @blog })
      ]  
    else
      render 'new'
    end
  end

    def edit
      # @blog = Blog.find(params[:id])
    end

    def update
      # @blog = Blog.find(params[:id])
      if @blog.update(blog_params)
        render turbo_stream: 
        [                
          turbo_stream.update('update_name',
          partial: "blogs/updated_names",
          locals: { blog: @blog })
        ]  
      else
        render 'edit'
      end
    end
    
    def show
    # @blog = Blog.find(params[:id])
    end

    def date
      @disable_nav = true
      @t = DateTime.now.strftime("%H:%M:%S")
    end
    def search
      @key = params[:key]
      @blog = Blog.find_by_sql("select * from Blogs where subject like '%#{@key}%'")
    end

    def time
      Turbo::StreamsChannel.broadcast_update_to("mystr", target: "content", partial: "/blogs/blog_name")
    end
    
    def destroy
      # debugger
      @blog.destroy
      # redirect_to root_path
       render turbo_stream: turbo_stream.remove("blog_#{ @blog.id }") 
    end

    private
    def blog_params
      params.require(:blog).permit(:name, :subject, :description)
    end

    def find_blog
      @blog = Blog.find(params[:id])
    end
end
