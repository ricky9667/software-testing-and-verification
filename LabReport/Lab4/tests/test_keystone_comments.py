import unittest
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains

from consts import SIGN_IN_URL, POSTS_URL, POST_COMMENTS_URL


class KeystoneCommentsTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = webdriver.Chrome()
        cls.sign_in()
        cls.create_post()

    @classmethod
    def tearDownClass(cls):
        cls.delete_post()

        if cls.driver:
            cls.driver.quit()

    @classmethod
    def sign_in(cls):
        cls.driver.get(SIGN_IN_URL)
        email = 'demo@keystonejs.com'
        password = 'demo'

        email_textfield = cls.driver.find_element(
            By.XPATH, "//input[@type='email' and @name='email']")
        email_textfield.send_keys(email)

        password_textfield = cls.driver.find_element(
            By.XPATH, "//input[@type='password' and @name='password']")
        password_textfield.send_keys(password)

        sign_in_button = cls.driver.find_element(
            By.XPATH, "//button[@type='submit']")
        sign_in_button.click()

        time.sleep(2)

    @classmethod
    def create_post(cls):
        cls.driver.get(POSTS_URL)

        time.sleep(2)

        # Posts page
        create_post_button = cls.driver.find_element(
            By.XPATH, "//button[@type='button']")
        create_post_button.click()

        # Show title textfield popup
        title_textfield = cls.driver.find_element(
            By.XPATH, "//input[@type='text' and @name='name']")
        title_textfield.send_keys("My first post")

        create_post_button = cls.driver.find_element(
            By.XPATH, "//button[@type='submit']")
        create_post_button.click()

        time.sleep(2)

    @classmethod
    def delete_post(cls):
        cls.driver.get(POSTS_URL)

        time.sleep(2)

        # Posts page
        created_post_delete_button = cls.driver.find_element(
            By.XPATH, "//span[@class='octicon octicon-trashcan']")
        created_post_delete_button.click()

        time.sleep(2)

        # Show delete popup
        popup_post_delete_button = cls.driver.find_element(
            By.XPATH, "//button[@type='button' and @data-button-type='confirm']")
        popup_post_delete_button.click()

        time.sleep(2)

    def test_1_create_comment(self):
        print('\n[Test] Create a comment on Admin UI page')

        self.driver.get(POST_COMMENTS_URL)
        time.sleep(2)

        # Post comments page
        create_comment_button = self.driver.find_element(
            By.XPATH, "//button[@type='button']")
        create_comment_button.click()

        time.sleep(2)

        # Show post comment popup
        author_section = self.driver.find_element(
            By.XPATH, "//div[@for='author']")
        author_dropdown_arrow = author_section.find_element(
            By.XPATH, "//span[@class='Select-arrow']")
        author_dropdown_arrow.click()

        actions = ActionChains(self.driver)
        actions.send_keys(Keys.TAB)  # Select Demo User
        actions.send_keys(Keys.TAB)  # Navigate to next field
        actions.send_keys(Keys.DOWN)  # Open dropdown
        actions.send_keys(Keys.TAB)  # Select post
        actions.send_keys(Keys.TAB)  # Navigate to create button
        actions.send_keys(Keys.ENTER)  # Click create button
        actions.perform()

        self.driver.get(POST_COMMENTS_URL)
        time.sleep(2)

        # Post comments page
        post_comments_item_list_wrapper = self.driver.find_element(
            By.XPATH, "//div[@class='ItemList-wrapper']")
        post_comments_td_elements = post_comments_item_list_wrapper.find_elements(
            By.TAG_NAME, "td")

        author_table_item = post_comments_td_elements[2].find_element(
            By.TAG_NAME, "a")
        self.assertEqual("Demo User", author_table_item.text)

        post_table_item = post_comments_td_elements[3].find_element(
            By.TAG_NAME, "a")
        self.assertEqual("My first post", post_table_item.text)

    def test_2_edit_comment(self):
        print('\n[Test] Edit a comment on Admin UI page')

        self.driver.get(POST_COMMENTS_URL)
        time.sleep(2)

        # Post comments page
        post_comments_item_list_wrapper = self.driver.find_element(
            By.XPATH, "//div[@class='ItemList-wrapper']")
        post_comment_state_item = post_comments_item_list_wrapper.find_elements(
            By.TAG_NAME, "td")[1]
        post_comment_state_item = post_comment_state_item.find_element(
            By.TAG_NAME, "a")
        post_comment_state_item.click()

        time.sleep(2)

        textfield_arrows = self.driver.find_elements(
            By.XPATH, "//span[@class='Select-arrow']")
        comment_state_arrow = textfield_arrows[2]
        comment_state_arrow.click()

        draft_state_item = self.driver.find_element(
            By.XPATH, "//div[text()='Draft']")
        draft_state_item.click()

        save_button = self.driver.find_element(
            By.XPATH, "//button[@type='button' and @class='css-2960tt']")
        save_button.click()

        self.driver.back()
        time.sleep(2)

        # Post comments page
        post_comments_item_list_wrapper = self.driver.find_element(
            By.XPATH, "//div[@class='ItemList-wrapper']")
        post_comment_state_item_td = post_comments_item_list_wrapper.find_elements(
            By.TAG_NAME, "td")[5]
        post_comment_state_item = post_comment_state_item_td.find_element(
            By.TAG_NAME, "div")
        self.assertEqual("Draft", post_comment_state_item.text)

    def test_3_delete_comment(self):
        print('\n[Test] Delete a comment on Admin UI page')

        self.driver.get(POST_COMMENTS_URL)
        time.sleep(2)

        # Post comments page
        created_post_delete_button = self.driver.find_element(
            By.XPATH, "//span[@class='octicon octicon-trashcan']")
        created_post_delete_button.click()

        time.sleep(2)

        # Show delete popup
        popup_comment_delete_button = self.driver.find_element(
            By.XPATH, "//button[@type='button' and @data-button-type='confirm']")
        popup_comment_delete_button.click()


if __name__ == '__main__':
    unittest.main()
