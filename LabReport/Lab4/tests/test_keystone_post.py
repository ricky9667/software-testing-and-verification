import unittest
import time
from selenium import webdriver
from selenium.webdriver.common.by import By

from consts import SIGN_IN_URL, ADMIN_UI_URL


class KeystonePostTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = webdriver.Chrome()
        cls.sign_in()

    @classmethod
    def tearDownClass(cls):
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

    def go_to_posts_page(self):
        self.driver.get(ADMIN_UI_URL)
        time.sleep(2)

        # Admin UI page
        posts_page_button = self.driver.find_element(
            By.XPATH, "//a[@href='/keystone/posts']")
        posts_page_button.click()

        time.sleep(2)

    def test_1_create_post(self):
        print('\n[Test] Create a post on the Admin UI page')

        self.go_to_posts_page()

        # Posts page
        create_post_button = self.driver.find_element(
            By.XPATH, "//button[@type='button']")
        create_post_button.click()

        # Show title textfield popup
        post_name = 'My first post'

        title_textfield = self.driver.find_element(
            By.XPATH, "//input[@type='text' and @name='name']")
        title_textfield.send_keys(post_name)

        create_post_button = self.driver.find_element(
            By.XPATH, "//button[@type='submit']")
        create_post_button.click()

        time.sleep(2)

        #! Not sure why posts_page_button is not clicked even though is correctly selected
        # toolbar_element = self.driver.find_element(
        #     By.XPATH, "//div[@class='Toolbar']")
        # print('toolbar_element.text =', toolbar_element.text)
        # posts_page_button = toolbar_element.find_element(
        #     By.XPATH, "//a[@href='/keystone/posts']")
        # print('posts_page_button.text =', posts_page_button.text)
        # posts_page_button.click()

        self.driver.back()
        time.sleep(2)

        # Posts page
        post_item_list_wrapper = self.driver.find_element(
            By.XPATH, "//div[@class='ItemList-wrapper']")
        created_post_name_button = post_item_list_wrapper.find_element(
            By.TAG_NAME, "a")

        self.assertEqual(post_name, created_post_name_button.text)

    def test_2_search_posts(self):
        print('\n[Test] Search posts by keyword on the Admin UI page')

        self.go_to_posts_page()

        # Posts page
        search_textfield = self.driver.find_element(
            By.XPATH, "//input[@type='text' and @placeholder='Search']")
        search_textfield.send_keys('first')

        post_item_list_wrapper = self.driver.find_element(
            By.XPATH, "//div[@class='ItemList-wrapper']")
        created_post_name_button = post_item_list_wrapper.find_element(
            By.TAG_NAME, "a")

        self.assertEqual('My first post', created_post_name_button.text)

    def test_3_search_posts_fail(self):
        print('\n[Test] Search posts fail by keyword on the Admin UI page')

        self.go_to_posts_page()

        # Posts page
        search_textfield = self.driver.find_element(
            By.XPATH, "//input[@type='text' and @placeholder='Search']")
        search_textfield.send_keys('second')

        time.sleep(2)

        no_posts_found_section = self.driver.find_element(
            By.XPATH, "//div[@class='css-l1jroy']")
        no_posts_found_text = no_posts_found_section.find_element(
            By.TAG_NAME, "h2")

        self.assertEqual('No posts found matching second',
                         no_posts_found_text.text)

    def test_4_edit_post(self):
        print('\n[Test] Edit a post on the Admin UI page')

        self.go_to_posts_page()

        # Posts
        post_item_list_wrapper = self.driver.find_element(
            By.XPATH, "//div[@class='ItemList-wrapper']")
        created_post_name = post_item_list_wrapper.find_element(
            By.TAG_NAME, "a")
        created_post_name.click()

        time.sleep(2)

        # Change state to `Published`
        state_section = self.driver.find_element(
            By.XPATH, "//div[@for='state']")
        state_dropdown_button = state_section.find_element(
            By.XPATH, "//span[@class='Select-arrow']")
        state_dropdown_button.click()
        state_publish_menu_item = self.driver.find_element(
            By.XPATH, "//div[@id='react-select-2--option-1']")
        state_publish_menu_item.click()

        # Change authon to `Demo User`
        # author_section = self.driver.find_element(
        #     By.XPATH, "//div[@for='author']")
        # author_dropdown_button = author_section.find_element(
        #     By.XPATH, "//span[@class='Select-arrow']")
        # author_dropdown_button.click()

        # time.sleep(5)

        # author_demo_user_menu_item = self.driver.find_element(
        #     By.XPATH, "//div[@id='react-select-15--option-0']")
        # author_demo_user_menu_item.click()

        save_button = self.driver.find_element(
            By.XPATH, "//button[@type='button' and @class='css-2960tt']")
        save_button.click()

        self.driver.back()

        time.sleep(2)

        # Posts page
        post_item_list_wrapper = self.driver.find_element(
            By.XPATH, "//div[@class='ItemList-wrapper']")
        created_post_state_wrapper = post_item_list_wrapper.find_elements(
            By.TAG_NAME, "td")[2]
        created_post_state_text = created_post_state_wrapper.find_element(
            By.TAG_NAME, "div")

        self.assertEqual("Published", created_post_state_text.text)

    def test_5_delete_post(self):
        print('\n[Test] Delete a post on the Admin UI page')

        self.go_to_posts_page()

        # Posts page
        created_post_delete_button = self.driver.find_element(
            By.XPATH, "//span[@class='octicon octicon-trashcan']")
        created_post_delete_button.click()

        time.sleep(2)

        # Show delete popup
        popup_post_delete_button = self.driver.find_element(
            By.XPATH, "//button[@type='button' and @data-button-type='confirm']")
        popup_post_delete_button.click()

        time.sleep(2)

        no_posts_found_text = self.driver.find_element(
            By.XPATH, "//h2[@class='css-pbviij']")
        self.assertEqual('No posts found...', no_posts_found_text.text)


if __name__ == '__main__':
    unittest.main()
