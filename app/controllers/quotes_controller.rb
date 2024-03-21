class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = Quote.all
  end

  def show; end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quotes_params)

    if @quote.save
      respond_to do |format|
        format.html {redirect_to quotes_path, notice: "Quote was succesfully created."}
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @quote.update(quotes_params)
      redirect_to quotes_path, notice: "Quote was succesfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was succesfully destroyed.", status: :see_other }
      format.turbo_stream
    end
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quotes_params
    params.require(:quote).permit(:name)
  end
end
