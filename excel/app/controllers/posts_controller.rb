class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      …
      format.xlsx {
          send_data Post.to_xlsx.to_stream.read, :filename => 'posts.xlsx', :type => "application/vnd.openxmlformates-officedocument.spreadsheetml.sheet"
      }

  end

  format.xlsx {
    chart_color =  %w(88F700, 279CAC, B2A200, FD66A3, F20062, C8BA2B, 67E6F8, DFFDB9, FFE800, B6F0F8)
    header_style = { :bg_color => "00", :fg_color => "FF", :alignment => { :horizontal => :center }, :bold => true }
    package = Post.to_xlsx(
    header_xf = package.workbook.styles.add_style header_style
    package.workbook.worksheets.first.tap do |sheet|
        sheet.row_style 0, header_xf
        sheet.add_chart(Axlsx::Pie3DChart, :title => "コメント獲得") do |chart|
            chart.add_series :data => sheet.cols[3][(1..-1)], :labels => sheet.cols[0][(1..-1)], :colors => chart_color
            chart.start_at 2, sheet.rows.size
            chart.end_at 3, sheet.rows.size + 20
        end
    end

    send_data package.to_stream.read, :filename => 'posts.xlsx', :type => "application/vnd.openxmlformates-officedocument.spreadsheetml.sheet"
}
  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
