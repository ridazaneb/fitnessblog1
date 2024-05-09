require "application_system_test_case"

class ExerciseRecordsTest < ApplicationSystemTestCase
  setup do
    @exercise_record = exercise_records(:one)
  end

  test "visiting the index" do
    visit exercise_records_url
    assert_selector "h1", text: "Exercise records"
  end

  test "should create exercise record" do
    visit exercise_records_url
    click_on "New exercise record"

    fill_in "Calories", with: @exercise_record.calories
    fill_in "Exercise", with: @exercise_record.exercise_id
    fill_in "Speed", with: @exercise_record.speed
    fill_in "Time", with: @exercise_record.time
    click_on "Create Exercise record"

    assert_text "Exercise record was successfully created"
    click_on "Back"
  end

  test "should update Exercise record" do
    visit exercise_record_url(@exercise_record)
    click_on "Edit this exercise record", match: :first

    fill_in "Calories", with: @exercise_record.calories
    fill_in "Exercise", with: @exercise_record.exercise_id
    fill_in "Speed", with: @exercise_record.speed
    fill_in "Time", with: @exercise_record.time
    click_on "Update Exercise record"

    assert_text "Exercise record was successfully updated"
    click_on "Back"
  end

  test "should destroy Exercise record" do
    visit exercise_record_url(@exercise_record)
    click_on "Destroy this exercise record", match: :first

    assert_text "Exercise record was successfully destroyed"
  end
end
