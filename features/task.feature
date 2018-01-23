#encoding: utf-8
Feature: Simple task for the job interview
  In order to verify that "add-to-cart" flow is working
  As a site user
  I should be able to search for the item, check it's features and add it to cart
Background:
    Given a browser is "Chrome"

Scenario: Search and add to cart
    When I navigate to "https://www.onliner.by/"
    And I search "Canon EOS 1300D"
    And I open "Canon EOS 1300D Body"
    Then firstly "Размер экрана" is "3 ''" 
    And secondly "Количество точек матрицы" is "18 Мп"
    And "Физический размер матрицы" is "APS-C (1.6 crop)"
    When I add the item to cart
    And I go to the cart
    Then 1 item in the cart
    And the item name is "Canon EOS 1300D Body"
