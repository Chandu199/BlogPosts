class Api::PostsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def index
		render json: Post.all
	end

	def show
		post = Post.find(params[:id])
		render json: post.as_json(include:[:comments])
	end

	def create
		post = Post.new(post_params)
		if post.save
			render status: 200,json: {
				message: "Successfully created post",
				post: post
				}.to_json
			else
				render statu: 422,json: {
					errors: post.errors
					}.to_json
				end
			end

			def update
				post = Post.find(params[:id])
				if post.update(post_params)
					render status: 200, json: {
						message: "Post updated successfully",
						post: post
						}.to_json
					else
						render status: 422,json: {
							message: "update failed",
							errors: post.errors
						}
					end
				end

				def destroy
					post = Post.find(params[:id])
					post.destroy
					render json: {
						status: 200,
						message: "Deleted successfully"
						}.to_json
					end

					private
					def post_params
						params.require(:post).permit(:title,:body)
					end
				end