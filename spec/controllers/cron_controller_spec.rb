require 'spec_helper'

describe CronController do
  describe '#crawl' do
    it 'renders "ok"' do
      get :crawl
      expect(response.body).to eq 'ok'
    end

    it 'calls Entry#crawl' do
      entry = FactoryGirl.create(:entry, :with_race, status: 'running')
      Entry.stub(:running).and_return([entry])
      expect(entry).to receive(:crawl)

      get :crawl
    end
  end
end
