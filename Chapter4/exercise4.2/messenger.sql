CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(16) NOT NULL,
    `user_pw` VARCHAR(64) NOT NULL,
    `user_name` VARCHAR(16) NOT NULL,
    `profile_img_link` VARCHAR(128) NOT NULL,
    `profile_msg` VARCHAR(128) NOT NULL,
    `is_deleted` TINYINT(1) NOT NULL DEFAULT 0,
    `admission_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `user` INT NOT NULL,
    `channel_link` VARCHAR(128) NOT NULL,
    `max_capacity` INT NOT NULL,
    `is_deleted` TINYINT(1) NOT NULL DEFAULT 0,
    `creation_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `msg` TEXT NOT NULL,
    `user` INT NOT NULL,
    `channel` INT NOT NULL,
    `chat_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`channel`) REFERENCES `channels`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `blocker` INT NOT NULL,
    `blocked` INT NOT NULL,
    `date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`blocker`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`blocked`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `follower` INT NOT NULL,
    `followee` INT NOT NULL,
    `date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`follower`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`followee`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;