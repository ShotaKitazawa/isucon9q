use `isucari`;

ALTER TABLE items ADD INDEX idx_seller_id(seller_id);
ALTER TABLE items ADD INDEX idx_created_at_id(created_at, id);

