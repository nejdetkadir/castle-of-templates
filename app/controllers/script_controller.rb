class ScriptController < ApplicationController
  def show
    @template = Template.active.find(params[:id])
    @template.update(download_count: @template.download_count + 1)
    send_data(@template.script)
  end
end
