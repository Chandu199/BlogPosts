class Api::CommentsController < ApplicationController
	
	skip_before_filter :verify_authenticity_token
	before_action :find_post

	def create
		comment = @post.comments.new(comment_params)
		if comment.save
			render status:200,json: {
				message: "comment created successfully",
				comment: comment
				}.to_json
			else
				render status: 422, json: {
					message: "comment not created",
					errors: comment.errors
					}.to_json
				end
			end

			def update
				comment = @post.comments.find(params[:id])
				if comment.update_attributes(comment_params)
					render status:200, json:{
						message:"Updated successfully",
						comment: comment
						}.to_json
					else
						render status: 422, json: {
							message: "Comment not able to update",
							errors: comment.errors
							}.to_json
						end

					end

					def destroy

						comment= @post.comments.find(params[:id])
						comment.destroy
						render status: 200, json: {
							message: "comment has been deleted"
						}
					end

					private
					def comment_params
						params.require(:comment).permit(:name,:body)
					end

					def find_post
						@post = Post.find(params[:post_id])
					end
				end