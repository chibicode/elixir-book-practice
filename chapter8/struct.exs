defmodule Attendee do
  @derive Access #=> Allows you to access attributes using [] notation
  defstruct name: "", paid: false, over_18: true

  def may_attend_after_party(attendee = %Attendee{}) do
    attendee.paid && attendee.over_18
  end
end

# This doesn't work b/c of the following erro:
# The struct was not yet defined or the struct is being accessed in the same context that defines it
# IO.inspect %Attendee{}
# IO.inspect %Attendee{ name: "Dave" }
# IO.inspect %Attendee{ name: "Mary", paid: true }

defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %{}, details: "", severity: 1
end

# report = %BugReport{ owner: %Customer{ name: "Dave", company: "Pragmatic"}, details: "Foo" }
# report.owner.company #=> "Pragmatic"

# To update, use this **macro**:
# put_in(report.owner.company, "PragProg")
# update_in(report.owner.company, &(&1 <> ", Inc."))
