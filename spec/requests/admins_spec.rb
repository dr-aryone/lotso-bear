# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Administrador" do
  subject {page}

  describe "Index" do
    let(:admin){FactoryGirl.create(:admin)}

    before do
      sign_in admin
    end
    it "Tiene Titulo" do should have_title ('SYRAT | Administrador') end
    it "Tiene link a Reportes" do should have_link('Reportes', href: reports_path) end
    it "Tiene link a Facturas" do  should have_link('Facturas', href:bills_path)  end
    it "Tiene link a Nóminas" do should have_link('Nóminas', href:paysheets_path) end
  end

  describe "Reportes" do
    before do
      visit reports_path
    end
    it "Tiene Titulo" do should have_title ('Reportes') end
  end

  describe "Facturas" do
    before do
      visit bills_path
    end
    it "Tiene Titulo" do should have_title ('Facturas')  end
  end

  describe "Nóminas" do
    before do
      visit paysheets_path
    end
    it "Tiene Titulo" do should have_title ('Nóminas') end
  end

end
