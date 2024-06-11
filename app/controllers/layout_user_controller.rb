class LayoutUserController < ApplicationController
    layout 'layout_user'
    before_action :authenticate_user!
end
