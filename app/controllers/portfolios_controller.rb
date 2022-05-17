class PortfoliosController < ApplicationController
  layout "portfolio"
	def index
		@portfolio_items = Portfolio.all
	end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

	def new
		@portfolio_item = Portfolio.new
    3.times { @portfolio_item.technoloogies.build }
	end

	def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  	@portfolio_item = Portfolio.find(params[:id])
  end

  def update
  	@portfolio_item = Portfolio.find(params[:id])
  	
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "The record was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    # Perform the lookup
      @portfolio_item = Portfolio.find(params[:id])

    # Destory/Delete record
      @portfolio_item.destroy

    # Redirect
      respond_to do |format|
        format.html { redirect_to portfolios_url, notice: "Portfolio was successfully destroyed." }
      end
    end

    private

      def portfolio_params
        params.require(:portfolio).permit(:title,
                                          :subtitle,
                                          :body,
                                          technoloogies_attributes: [:name])
      end

end
