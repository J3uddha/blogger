class ArticlesController < ApplicationController

	before_filter :require_login, except: [:index, :show]

	include ArticlesHelper #brings in param requirements for making new articles

	def index
	  @articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	#instead of @article.comment.new...
	#we do the following or else it'll show a blank comment box as a comment already written
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
		#use fail to check what kind of info is being submitted using 'create'
		#fail

	  #@article = Article.new(
	  #  title: params[:article][:title],
	  #  body: params[:article][:body])

	  #simplified version (doesn't work for security reasons, do the below instead)
	  #@article = Article.new(params[:article])

		@article = Article.new(article_params)
  		@article.save
  		flash.notice = "Article '#{@article.title}' Saved!"
  		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash.notice = "Article '#{@article.title}' Deleted!"
		
		redirect_to articles_path#(@articles)
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
  		@article = Article.find(params[:id])
  		@article.update(article_params)
  		flash.notice = "Article '#{@article.title}' Updated!"
  		redirect_to article_path(@article)
	end
end
