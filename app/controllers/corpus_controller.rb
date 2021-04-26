class CorpusController < ApplicationController
    def new
        @corpus = Corpu.new
    end
    
    def create
        if params[:commit] == 'Submit'
            @corpus = Corpu.new(params.require(:corpu).permit(:question, :answer))
            if @corpus.save
                puts "Block saved succesfully"
                redirect_to new_corpu_path, :notice => "Question saved successfully"
            else
                puts "Could not save the block"
            end
        else
        end
    end
end
