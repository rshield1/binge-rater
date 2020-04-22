Models -
    - User
    - Show
    - Rating

Views -
    -Users
        -index.erb
        -login.erb
        -signup.erb
        -logout.erb
        -show.erb
    -Shows
        -edit.erb
        -index.erb
        -new.erb
        -show.erb

Controllers -
    - application_controller
    - shows_controller
    - users_controller


--------------------------------------------------------------------

What should I be prepared to answer??  Well lets answer these questions!

1. Explain the MVC framework

    Separation of concerns, single responsibility, keep code organized.

2. How do we access data in our views that we defined in our controllers?

    When you store the params in an instance variable within the defined block, you can use
    the information when you render the show page as erb tags within the view <%=  %>

3. What is the difference between “redirect to” and “erb”
        redriect -- display the change of state post/patch/delete.
        erb -- used during get requests to rectieve a page that already exists.

    

4. What methods do we get from “belongs_to”, “has_many”, and “has_secure_password”?

    Belongs to: 

        association(force_reload = false)
            Returns the associated object. nil is returned if none is found.

        association=(associate)
            Assigns the associate object, extracts the primary key, and sets it as the foreign key.

        build_association(attributes = {})
            Returns a new object of the associated type that has been instantiated with attributes and linked to this object through a foreign key, but has not yet been saved.

        create_association(attributes = {})
            Returns a new object of the associated type that has been instantiated with attributes, linked to this object through a foreign key, and that has already been saved (if it passed the validation).

        (association is replaced with the symbol passed as the first argument, so belongs_to :author would add among others author.nil?.)

    Has many:

        collection.delete(object, …)
            Removes one or more objects from the collection by setting their foreign keys to NULL. Objects will be in addition destroyed if they're associated with :dependent => :destroy, and deleted if they're associated with :dependent => :delete_all.

        collection=objects
            Replaces the collections content by deleting and adding objects as appropriate.

        collection_singular_ids
            Returns an array of the associated objects' ids

        collection_singular_ids=ids
            Replace the collection with the objects identified by the primary keys in ids

        collection.clear
            Removes every object from the collection. This destroys the associated objects if they are associated with :dependent => :destroy, deletes them directly from the database if :dependent => :delete_all, otherwise sets their foreign keys to NULL.

        collection.empty?
            Returns true if there are no associated objects.

        collection.size
            Returns the number of associated objects.

        (Note: collection is replaced with the symbol passed as the first argument, so has_many :clients would add among others clients.empty?.)
    
    Has_secure_password:

        secures the password with a params hash using password_digest (bcrypt gem)

5. How do we represent relationships between models in our tables?

        When your models inherit from ActiveRecord::Base, it creates the connection with your models
        and the tables created in your database.  Create migrations!

6. What are params? What are the two places they come from? 

    params is a hash that are taken from the form created in our erb pages to use in our routes.  We take the information from the key "name."


7. What are sessions?

    session are a way to track users when they log in.  


8. What is the flow of your application? (i.e. what triggers your get routes vs post routes or patch routes or delete routes)

    CRUD REST


9. How do you authenticate your users when they log in?

    We use the class method .authenticate to authenticate the user's password.  We check the #password digest which is placed in the database table.  We will need to set the has_secure_password, which comes from the bcrypt gem, keeps it secured to store encrypted version.

10. How do you validate that a username is unique?

    Check the validity of the user true/false with .valid?  Validates is a method that comes within Active Record.
        validates :username, presence: true, uniqueness: true

11. Why do I need to check that a resource belongs to the current user in the patch and delete routes?

