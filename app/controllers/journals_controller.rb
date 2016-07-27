class JournalsController < ApplicationController
  before_action :find_journal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:year].present? && params[:month].present? && params[:day].present?
      @year = params[:year].to_s
      @month = params[:month].to_s
      @day = params[:day].to_s
      @date_string = @year + "" + @month + @day
      @journals = Journal.where(date: @date_string).order("date DESC")
    elsif params[:year].present? && params[:month].present?
      @year = params[:year].to_s
      @month = params[:month].to_s
      @date_string = "" + @year + @month

      @date = Date.parse(@date_string.concat("01"))
      @month_string = @date.strftime("%B")
      @display_dates = @date.week_split

    elsif params[:year].present?
      @year = params[:year].to_s
      @journals = Journal.where('extract(year from date) = ?', @date_string).order("date DESC")
    else
      @journals = Journal.all.order("date DESC")
    end
  end

  def show
    @year = @journal.date.year
    @month = @journal.date.strftime("%B")
    @day = @journal.date.mday
  end

  def new
    @journal = current_user.journals.build
  end

  def create
    @journal = current_user.journals.build(journal_params)

    if @journal.save
      redirect_to @journal, notice: "Successfully saved your daily journal!"
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @journal.update(journal_params)
      redirect_to @journal
    else
      render 'edit'
    end
  end

  def destroy
    @journal.destroy
    redirect_to root_path, notice: "Successfully deleted your daily journal!"
  end

  private
  def journal_params
    params.require(:journal).permit(:date, :content, :improvement, :q1answers, :q2answers, :q3answers, :q4answers, wins_attributes: [:id, :win, :_destroy], lessons_attributes: [:id, :lesson, :_destroy])
  end

  def find_journal
    @journal = Journal.find(params[:id])
  end

end
